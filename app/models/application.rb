class Application < ActiveRecord::Base
  attr_accessible :approval_date, :reason, :status, :submission_date, :scholarship_id, :user_id, :on_card

  belongs_to :scholarship
  belongs_to :user

  def show_by_specialization(options={})
 
  	@all_applications = Application.joins('JOIN user ON applications.user_id = participates.concert_id').where('participates.user_id = \'' + options[:user_id]+'\'')
  	where(scholarship_id: options[:scholarship_id])

  	return @all_applications

  	logger.info("SUNT IN FUNCTIA SHOW_MANAGER")
  end
end
