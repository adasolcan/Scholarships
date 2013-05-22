Team9Scholarships::Application.routes.draw do
  resources :document_types

  resources :scholarships
  resources :applications
  
  root :to => 'applications#index'
  # omniauth
  match '/auth/:provider/callback', :to => 'user_sessions#create'
  match '/auth/failure', :to => 'user_sessions#failure'

  # Custom logout
  match '/logout', :to => 'user_sessions#destroy'

  #match '/manager', :to => 'applications#admin_manager'
  match '/admin', :to => 'applications#admin'

  match '/applications/:scholarship_id/new', :to => 'applications#new'
  
  match '/applications/:class_year/:specialization/:scholarship_id/manager', :to => 'applications#admin_manager'

  match '/applications/verified/:application_id', :to => 'applications#verified'
  match '/applications/unapproved/:application_id', :to => 'applications#unapproved'

  match '/upload/handler', :to => 'upload#handler'
end
