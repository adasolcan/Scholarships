class DocumentType < ActiveRecord::Base
  attr_accessible :doc_type
  
  belongs_to :document
end
