class UserController < ApplicationController
  def get_info
    redirect_to "#{PROVIDER_URL}/users/#{params["id"]}"
  end
end
