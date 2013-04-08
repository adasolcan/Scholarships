APP_ID = '5d6d6b67-db3c-4315-abe6-f482f241ba5f'
APP_SECRET = '6ce42bcbffa315f14d9a4ba82f752d17fcad4850f5f336edbb'

CUSTOM_PROVIDER_URL = 'http://fmi-autentificare.herokuapp.com'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :autentificare, APP_ID, APP_SECRET
end
