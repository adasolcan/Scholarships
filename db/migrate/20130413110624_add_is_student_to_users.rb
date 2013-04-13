class AddIsStudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_student, :string
  end
end
