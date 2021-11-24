Rails.application.routes.draw do
  root 'publications#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :publications do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  get '/publications_publi', to:'publications#publi', as: 'userpub'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
