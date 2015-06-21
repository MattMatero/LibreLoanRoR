class AddIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_id, :string
  end
end
