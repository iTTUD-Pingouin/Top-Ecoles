Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :schools, only: [:index, :show] do
    collection do
      get "selection", to: "schools#selection"
      get "test", to: "schools#parsing_sample_csv"
    end
    member do
      get "compare", to: "schools#add_to_compare_list"
    end
  end

  get "clean", to: "schools#clean_list"


end
