class Scholarship < ActiveRecord::Base
  attr_accessible :stype, :value

  has_one :application, :foreign_key => "scholarship_id" 
end
