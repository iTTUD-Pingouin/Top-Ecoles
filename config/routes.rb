Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :schools, only: [:index, :show] do
    collection do
      get "selection", to: "schools#selection"
      get "test", to: "schools#parsing_sample_csv"
    end
  end
end
