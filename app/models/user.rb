class User < ActiveRecord::Base
  attr_accessible :uid

  has_many :applications, :foreign_key => "user_id" 
end
