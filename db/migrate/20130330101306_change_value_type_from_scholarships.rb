class ChangeValueTypeFromScholarships < ActiveRecord::Migration
  def up
    change_column :scholarships, :value, :integer
  end

  def down
    change_column :scholarships, :value, :string
  end
end
