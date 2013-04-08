Team9Scholarships::Application.routes.draw do
  resources :scholarships

  resources :applications
  
  root :to => 'applications#index'
  # omniauth
  match '/auth/:provider/callback', :to => 'user_sessions#create'
  match '/auth/failure', :to => 'user_sessions#failure'

  # Custom logout
  match '/logout', :to => 'user_sessions#destroy'



  #students by specialization
   
end
