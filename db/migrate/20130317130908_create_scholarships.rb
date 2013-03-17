class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :stype
      t.string :value

      t.timestamps
    end
  end
end
