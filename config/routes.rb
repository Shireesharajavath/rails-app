Rails.application.routes.draw do
  # ✅ Health check route (no authentication required)
  get "/health", to: "health#check"

  # Root page (browser)
  root "todos#index"

  # Todos CRUD (works for both HTML + JSON if you request with headers)
  resources :todos

  # ---------- API routes (JSON only) ----------
  namespace :api, defaults: { format: :json } do
    # User authentication
    post "signup",      to: "users#signup"       # API signup
    post "login",       to: "users#login"        # API login
    post "get_api_key", to: "users#get_api_key"  # Generate/retrieve API key
    get  "me",          to: "users#me"           # Current authenticated user
    post "logout",      to: "users#logout"       # API logout endpoint

    # Profile routes
    post "getProfile",    to: "users#get_profile"
    post "updateProfile", to: "users#update_profile"

    # RESTful todos (API)
    resources :todos, only: [:index]

    # Search todos (custom endpoint)
    post "search_todos", to: "todos#search_todos"

    # RESTful users
    resources :users, only: [:create, :index, :show]
  end

  # ---------- Todo time logs ----------
  resources :todo_time_logs, only: [] do
    collection do
      post :start
      post :stop
    end
  end
end
