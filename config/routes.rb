Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  
  
  namespace :public do
  resources :users, only: [:show, :edit, :uodate]
  get "homes/terms" => "homes#terms"
  
  
  end
  devise_for :users,path: :public,skip: [:passwords], controllers: {
  registrations: "public/user/registrations",
  sessions: 'public/user/sessions'
}

  

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
