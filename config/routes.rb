Rails.application.routes.draw do

  resources :gets
devise_for :users, skip: [:sessions], :controllers => {
 :registrations => 'users/registrations'
}

devise_scope :user do
  get 'login' => 'users/sessions#new', as: :new_user_session
  post 'login' => 'users/sessions#create', as: :user_session
  get 'logout' => 'users/sessions#destroy', as: :destroy_user_session
  
end

  get '/new' => 'presents#new'
  root :to => 'presents#index'
  resources :presents
  resources :presents do
    member do
      put 'like'    => 'presents#like'
      put 'dislike' => 'presents#dislike'
      put 'unvote'  => 'presents#unvote'
    end
  end
  resources :users
  resources :users do 

    member do
      put 'follow'    => 'users#follow'
      put 'unfollow'    => 'users#unfollow'
    end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
