APP_ID = '770d6412-c66f-4521-88ea-fe097c2e57cd'
APP_SECRET = '5ec0b2e324abf75797a11a774084c7ec13bf33db40aa37822c'

CUSTOM_PROVIDER_URL = 'http://fmi-autentificare.herokuapp.com'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :autentificare, APP_ID, APP_SECRET
end
