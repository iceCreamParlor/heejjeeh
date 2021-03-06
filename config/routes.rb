Rails.application.routes.draw do
  resources :profiles
  resources :issues
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  post 'portfolios/image_upload' => 'portfolios#image_upload'
  resources :portfolios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'
end
