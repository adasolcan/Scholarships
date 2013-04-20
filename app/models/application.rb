class Application < ActiveRecord::Base
  attr_accessible :approval_date, :reason, :status, :submission_date, :scholarship_id, :user_id, :on_card

  belongs_to :scholarship
  belongs_to :user

  def show_manager(options={})
    Application.where(scholarship_id: options[:scholarship_id])
  end
end
