Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show, :index ] do
    resources :groups, only: [:show, :new, :create, :destroy ]
  end

  resources :events, only: [:show, :index ] do
  end

  resources :favorites, only: [:index, :show, :new, :create, :destroy] do
  end

  get "events/:id/add_favorites", to: "favorites#add_favorites", as: :add_favorites
  get "events/:id/confirm_order", to: "orders#confirm_order", as: :confirm_order
  get "events/:id/failed_order", to: "orders#failed_order", as: :failed_order
  get "my_orders", to: "orders#my_orders", as: :my_orders

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
