class Document < ActiveRecord::Base
  attr_accessible :application_id, :document_type, :source, :title
  
  has_one :document_type, :foreign_key => "document_type"
  has_one :appliaction, :foreign_key => "application_id"
end
