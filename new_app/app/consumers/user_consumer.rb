# frozen_string_literal: true

class UserConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      puts "Message payload: #{message.payload}"
      data = message.payload['payload']['after']
      puts data

      name = data['name'].split(' ')
      user = User.find_or_initialize_by(id: data['id'])
      user.assign_attributes(first_name: name.first, last_name: name.last)
      user.save!
    end
  end
end