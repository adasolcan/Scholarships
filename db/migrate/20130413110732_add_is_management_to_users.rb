class AddIsManagementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_management, :string
  end
end
