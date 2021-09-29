Rails.application.routes.draw do
  get 'musics/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'musics#index'
  resources :users , only: [:show, :edit, :update]
  resources :musics do
    resources :comments, only: :create
  end
end
