Rails.application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:create]
  end
  resources :posts, except: [:create] do
    resources :comments, only: [:new, :create]
  end


  root to: redirect("/subs")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
