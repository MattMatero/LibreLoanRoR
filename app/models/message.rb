class Message < ActiveRecord::Base


  def self.read(id)
    Message.find(id).read ? 'viewed' : 'new'
  end

  def self.userMessages(user_id)
    Message.where(receiver_id: user_id.to_s)
  end

end
