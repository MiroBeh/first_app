Rails.application.routes.draw do
  resources :products
  root 'simple_pages#landing_page'
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  post 'simple_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]
end
