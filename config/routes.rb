PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: "sessions#new"

  resources :posts, except: [:destroy] do
    resources :comments
  end
  resources :categories, except: [:destroy]
end
