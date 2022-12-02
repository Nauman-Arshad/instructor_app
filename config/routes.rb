Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home/index'

  root to: 'home#index'

  resources :users, only: [:create] do
    collection do
      get :logout
      post :login
    end
  end

  resources :courses, only: [:index, :new, :create, :show]
  resources :topics, only: [:new, :create, :destroy, :edit, :update]
  resources :learning_objectives, only: [:new, :create, :edit, :update, :destroy]
  resources :bloom_taxonomy_verbs
end
