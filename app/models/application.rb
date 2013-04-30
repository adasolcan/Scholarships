class Application < ActiveRecord::Base
  attr_accessible :approval_date, :reason, :status, :submission_date, :scholarship_id, :user_id, :on_card

  belongs_to :scholarship
  belongs_to :user

  def show_by_class_year(options={})
  	logger.info("SUNT IN FUNCTIA show_by_class_year")
 	@user = User.last
 	@users = @user.show_students_by_year({:year => options[:class_year], :token => options[:token]})
 	logger.info("@USERS.INSPECT = "+@users.inspect)
 	logger.info("@users[0][user][id].to_s = " + @users[0]["user"]["id"].to_s)
 	@all_applications = Application.joins('JOIN users ON applications.user_id = users.id').where('applications.status = \'In asteptare\' AND users.uid = \'' + @users[0]["user"]["id"].to_s + '\'')
 	logger.info("@all_applications = " + @all_applications.inspect)
 	@users.each do |user|
 		logger.info("ITERATE : "+user["user"]["id"].to_s);
 		@application = Application.joins('JOIN users ON applications.user_id = users.id').where('applications.status = \'In asteptare\' AND users.uid = \'' + user["user"]["id"].to_s + '\'')
 		logger.info("@all_applications = " + @all_applications.inspect)
 		@all_applications.merge(@application)
 	end
  	#@all_applications = Application.joins('JOIN user ON applications.user_id = users.id').where('user.user_id = \'' + options[:class_year]+'\'')
  	#where(scholarship_id: options[:scholarship_id])

  	return @all_applications

  	#logger.info("USER : "+ @users[0]["id"])
  end
end
