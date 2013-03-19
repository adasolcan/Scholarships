class Application < ActiveRecord::Base
  attr_accessible :approval_date, :id, :reason, :status, :submission_date
end
