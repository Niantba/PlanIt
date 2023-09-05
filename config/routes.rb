Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "profile", to: "pages#profile"
  patch "profile", to: "pages#add_documents"

  resources :trips, only: %i[new create update show index] do
    resources :user_trips, only: %i[new create]
    resources :activities, only: %i[create] do
      resources :comments, only: %i[create]
    end
    resources :expenses, only: %i[index create new]
  end

  delete '/trips/:id', to: 'trips#destroy', as: "delete"
  resources :documents, only: %i[new create delete]

  resources :activities, only: %i[delete]

end
