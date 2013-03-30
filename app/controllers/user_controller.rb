require "net/http"
require "uri"

class UserController < ApplicationController
  def get_info
    #redirect_to "#{PROVIDER_URL}/users/#{params["id"]}"
    
    uri = URI.parse("#{PROVIDER_URL}/users/#{params["id"]}.json")
    print uri
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    print response.body
    respond_to do |format|
	format.json { render  :json => "salut"}
   end
 end
end
