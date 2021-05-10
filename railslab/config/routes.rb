Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  post "/login", to: "authentication#login"
  get 'api/articles', to: "articles#api_index"
  
  resources :articles do
    resources :comments
  end
  root 'articles#index'
  
 
end
