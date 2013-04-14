APP_ID = '096a9bf8-3acf-42a4-b3cf-cdad73d1a936'
APP_SECRET = 'fa9189b4e2257b0f1a19e69a8dcca0c052efa0a6a468b3b369'

CUSTOM_PROVIDER_URL = 'http://fmi-autentificare.herokuapp.com'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :autentificare, APP_ID, APP_SECRET
end
