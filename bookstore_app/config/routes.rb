Rails.application.routes.draw do
  get 'sessions/index'
  # get 'sessions/new'
  resources :sessions
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'novels/index'
  get 'novels/show'
  get 'novels/new'
  get 'novels/create'
  get 'novels/update'
  get 'novels/edit'
  get 'novels/destroy'
  get 'publishers/index'
  get 'publishers/show'
  get 'publishers/new'
  get 'publishers/create'
  get 'publishers/update'
  get 'publishers/edit'
  get 'publishers/destroy'
  get 'authors/index'
  get 'authors/show'
  get 'authors/new'
  get 'authors/create'
  get 'authors/update'
  get 'authors/edit'
  get 'authors/destroy'
  get 'genres/index'
  get 'genres/show'
  get 'genres/new'
  get 'genres/create'
  get 'genres/update'
  get 'genres/edit'
  get 'genres/destroy'
  get 'author/index'
  get 'author/show'
  get 'author/new'
  get 'author/create'
  get 'author/update'
  get 'author/edit'
  get 'author/destroy'
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/contact'
  resources :novels do
    collection do
      get :search
    end
  end
  resources :books
  resources :authors
  resources :genres
  resources :publishers
  get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
