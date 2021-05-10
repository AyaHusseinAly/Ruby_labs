Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  
  post 'authenticate', to: 'authentication#authenticate'
  
  get 'api/articles', to: "articles#api_index"
  resources :articles do
    resources :comments
  end
  root 'articles#index'
  #get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
