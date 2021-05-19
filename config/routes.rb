Rails.application.routes.draw do
  resources :pets # create pets resource RESTful urls
  root 'pets#index' # set root route
end
