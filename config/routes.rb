Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :doctor_specialities, only: %i[new create]
  # get '/speciality/new', to: 'speciality#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
