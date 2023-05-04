class AddChangesToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email
    rename_column :users, :name, :username
  end
end
