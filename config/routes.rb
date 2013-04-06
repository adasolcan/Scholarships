Team9Scholarships::Application.routes.draw do
  devise_for :users

  resources :scholarships

  resources :applications
  
  root :to => 'static_pages#index'
  # omniauth
  match '/auth/:provider/callback', :to => 'user_sessions#create'
  match '/auth/failure', :to => 'user_sessions#failure'
  match '/user_new_session', :to => 'user_sessions#create', :via => [:post]
  match '/autentificare', :to => redirect("#{PROVIDER_URL}/auth/autentificare/authorize") 

  # Custom logout
  match '/logout', :to => 'user_sessions#destroy'

  #match '/users' => redirect('http://fmi-autentificare.herokuapp.com/users')
  match '/users/:id' => 'user#get_info', :via => [:get]   #redirect("#{PROVIDER_URL}/users/#{params["id"]}")
  
  #students by specialization
   
end
