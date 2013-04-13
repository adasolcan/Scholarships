class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :doc_type

      t.timestamps
    end
  end
end
