Rails.application.routes.draw do
  root to: 'hello#index'
  get 'hello/index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get  'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :places
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
