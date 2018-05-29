Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :schools, only: [:index, :show] do
    collection do
      get "selection", to: "schools#selection"
    end
  end
end
