Rails.application.routes.draw do
  resources :images
  devise_for :users
  authenticated :user do
    root 'pages#image_items', as: :authenticated_root
  end
  root 'pages#home'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :images, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
