Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'
  get '/filter', to: 'home#filter'
  resources :doctor_specialities, only: %i[new create]
  resources :profile, only: %i[show edit update]
  resources :appointments, only: %i[index update]
  post 'appointments/:id', to: 'appointments#create'
  # resources :user, only: %i[new create]
  get '/user/new', to: 'user#new'
  post 'user', to: 'user#create'
  # get '/doctor/edit', to: 'doctor#edit'
  # get '/speciality/new', to: 'speciality#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
