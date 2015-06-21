class Book < ActiveRecord::Base


  def self.userBooks(current_user)
    Book.where(user_id:  current_user.id)
  end
end
