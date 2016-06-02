Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'activities#index'
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :activities
  resources :users
  resources :companies do
    resources :company_comments
  end
  resources :contacts
  resources :tasks

  get 'pages/test', to: 'pages#test'
end
