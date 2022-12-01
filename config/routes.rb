Rails.application.routes.draw do
  
  namespace :admin do
    resources :tags, only: [:index, :create, :destroy]
  end

  root to: 'public/homes#top'
  get '/search', to: 'searchs#search'

  namespace :admin do
    root to: 'homes#top'
  end

  namespace :public do
    resources :users, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
      end
    end
    
    resources :rooms, only: [:create, :show]
    resources :messages, only: [:create]
    
    resources :notifications, only: [:index]
    
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resources :reposts, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'homes/terms' => 'homes#terms'
    get 'follow_index' => 'posts#follow_index'
  end
  
  devise_for :users, path: :public, skip: [:passwords], controllers: {
    registrations: 'public/user/registrations',
    sessions: 'public/user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
