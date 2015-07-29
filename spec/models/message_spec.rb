require 'rails_helper'

RSpec.describe Message, type: :model do  
  M1 = FactoryGirl.create(:message)
  
  describe 'user_messages' do 
    it 'returns a list of messages' do
      #assumes user has at least 1 message
      msg = Message.userMessages(1)
      msg.should_not == nil
    end
  end
end