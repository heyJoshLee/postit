PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"

  resources :posts, except: [:destroy] do
    resources :comments
  end
  resources :categories, except: [:destroy]
end
