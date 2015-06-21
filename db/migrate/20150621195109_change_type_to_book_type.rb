class ChangeTypeToBookType < ActiveRecord::Migration
  def change
    rename_column :books, :type, :booktype
  end
end
