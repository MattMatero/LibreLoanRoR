class RenameModelToUser < ActiveRecord::Migration
  def change
    rename_table :models, :user
  end
end
