Rails.application.routes.draw do
  devise_for :users
  root 'publications#index'
  resources :publications do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  get '/publications_publi', to:'publications#publi', as: 'userpub'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
