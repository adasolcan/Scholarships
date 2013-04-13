class AddIsTeacherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_teacher, :string
  end
end
