class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :book_id
      t.string :owner_id
      t.string :borrow_id

      t.timestamps null: false
    end
  end
end
