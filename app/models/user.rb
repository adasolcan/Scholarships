class User < ActiveRecord::Base
  attr_accessible :uid, :first_name, :last_name

  def show_by_id(options={})
    User.where(id: options[:id])
  end

  def show_details_by_id(options={})
    JSON.parse(open("http://fmi-autentificare.herokuapp.com/users/#{options[:id]}.json?oauth_token=#{options[:token]}").read)
  end

  def show_students_by_year(options={})
    logger.info("SUNT IN FUNCTIA show_students_by_year")
    JSON.parse(open("http://fmi-autentificare.herokuapp.com/groups/year/#{options[:year]}.json?oauth_token=#{options[:token]}").read)
  end
end
