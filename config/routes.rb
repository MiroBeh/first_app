Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user_registrations'}
  resources :users
  resources :products do
    resources :comments
  end
  resources :payments, only: [:create]
  root 'simple_pages#landing_page'
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  post 'simple_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]
end
