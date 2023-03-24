Rails.application.routes.draw do
  devise_for :users
  
  resources :groups, only: [:index, :new, :create, :show, :destroy, :edit] do
    resources :operations, only: [:index, :new, :create, :show, :destroy, :edit]
  end
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do 
  
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end

  end
end
