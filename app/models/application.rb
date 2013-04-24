class Application < ActiveRecord::Base
  attr_accessible :approval_date, :reason, :status, :submission_date, :scholarship_id, :user_id, :on_card

  belongs_to :scholarship
  belongs_to :user

  def show_manager(options={})
 
  @all_applications = Application.where(scholarship_id: options[:scholarship_id])

  return @all_applications

  logger.info("SUNT IN FUNCTIA SHOW_MANAGER")
  end
end
