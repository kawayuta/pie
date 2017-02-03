Rails.application.routes.draw do

  resources :collectionrelations
  resources :collections
  resources :gets


get '/gets', to: redirect('')
get '/gets/new', to: redirect('')
get '/gets/:id/edit', to: redirect('')
get '/presents/:id', to: redirect('')
get '/presents/new', to: redirect('')
get '/presents/:id/edit', to: redirect('')


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
  resources :comments
  resources :presents
  resources :presents do
    member do
      put 'like'    => 'presents#like'
      put 'dislike' => 'presents#dislike'
      put 'unvote'  => 'presents#unvote'
     
      put 'poll_first'    => 'polls#poll_first', as: 'poll_first'
      put 'poll_second'    => 'polls#poll_second', as: 'poll_second'
      put 'poll_third'    => 'polls#poll_third', as: 'poll_third'
      put 'poll_four'    => 'polls#poll_four', as: 'poll_four'

    end
  end

  
  resources :users
  resources :users do 

    member do
      put 'follow'    => 'users#follow'
      put 'unfollow'    => 'users#unfollow'
    end
  end

  resources :gets do
    member do
      put 'like'    => 'gets#like'
      put 'dislike' => 'gets#dislike'
      put 'unvote'  => 'gets#unvote'
    end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
