Rails.application.routes.draw do
   get 'favorites/new'

  get 'sessions/new'

  get 'welcome/index'
  
    resources :posts do
    resources :comments do
    collection do
      post :confirm
    end
    end
  end
  resources :favorites, only: [:create, :destroy]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

 root 'welcome#index'

end

