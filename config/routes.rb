Rails.application.routes.draw do
  # Health check
  get "/health", to: "health#check"

  # Root page
  root "todos#index"

  # Browser HTML todos
  resources :todos, only: [:index, :create, :update, :destroy]

  # API namespace
  namespace :api, defaults: { format: :json } do
    # User auth
    post "signup",      to: "users#signup"
    post "login",       to: "users#login"
    post "get_api_key", to: "users#get_api_key"
    get  "me",          to: "users#me"
    post "logout",      to: "users#logout"

    # Profile
    post "getProfile",    to: "users#get_profile"
    post "updateProfile", to: "users#update_profile"

    # Todos API
    resources :todos, only: [:index, :create, :update, :destroy] do
      collection do
        post :search_todos
      end
    end

    # Users API
    resources :users, only: [:create, :index, :show]
  end
end
