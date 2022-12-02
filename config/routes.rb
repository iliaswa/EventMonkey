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
    resources :favorites, only: [:index, :show, :new, :create, :destroy]
  end

  get "events/:id/add_favorites", to: "favorites#add_favorites", as: :add_favorites
end
