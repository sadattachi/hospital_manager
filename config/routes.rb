Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'
  get '/filter', to: 'home#filter'
  resources :appointments, only: %i[index update]
  post 'appointments/:id', to: 'appointments#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
