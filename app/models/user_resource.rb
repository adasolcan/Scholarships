class UserResource < ActiveResource::Base
  # attr_accessible :title, :body
  self.site = "http://fmi-autentificare.herokuapp.com/"
  self.element_name = "users"
end
