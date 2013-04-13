class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.integer :document_type
      t.binary :source
      t.integer :application_id

      t.timestamps
    end
  end
end
