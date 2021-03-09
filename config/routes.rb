Rails.application.routes.draw do
  resources :todos
  resources :posts do
    resources :comments, only: [:create, :destroy]
    member do
      get :hovercard
    end
  end
  root to: "pages#feed"
  get 'pages/query'
  get 'pages/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
