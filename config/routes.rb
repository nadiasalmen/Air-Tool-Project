Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tools do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [ :new, :create ]
  end
  resources :reservations, only: [:index, :show, :edit, :update]
  get "my_tools", to: "tools#my_tools"
end
