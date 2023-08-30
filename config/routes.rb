Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trips, only: %i[new create update show index] do
    resources :user_trips, only: %i[new create]
    resources :activities, only: %i[create]
  end

  resources :documents, only: %i[new create delete]

  resources :activities, only: %i[delete] do
    resources :comments, only: %i[create]
  end

  resources :user_trips, only: %i[] do
    resources :expenses, only: %i[create new]
  end

  resources :expenses, only: %i[index]
end
