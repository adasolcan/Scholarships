class Application < ActiveRecord::Base
  attr_accessible :approval_date, :reason, :status, :submission_date
end
