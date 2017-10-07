Rails.application.routes.draw do
  root 'milestones#index'

  resources :missions, only: [:index, :show]
  resources :milestones, only: [:index, :show]
end
