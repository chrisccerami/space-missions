Rails.application.routes.draw do
  resources :missions, only: [:index]
end
