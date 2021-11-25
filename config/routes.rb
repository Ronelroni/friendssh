Rails.application.routes.draw do
  devise_for :users
  root 'instas#index'
  resources :publications do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  get '/users_profil', to:'users#profil', as: 'profil'
  get '/publications_publication', to:'publications#publication', as: 'allpub'
  get '/publications_publi', to:'publications#publi', as: 'userpub'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
