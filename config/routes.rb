Rails.application.routes.draw do
  
  resources :users, only: [:index, :edit, :update]
    get 'users/account'
  devise_for :users
  devise_scope :user do
    get "users", to: redirect("/users/sign_up")
  end

    get 'rooms/search'
  resources :rooms, only: [ :index, :new, :show, :create, :destroy]

    post 'reservations/confirm'
    post 'reservations/back'
  resources :reservations, only: [:index, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tops
    root to: "tops#index"
end
