class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :id
      t.date :submission_date
      t.date :approval_date
      t.string :status
      t.text :reason

      t.timestamps
    end
  end
end
