PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, except: [:destroy]
end
