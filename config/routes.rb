Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get '/home/about' => "homes#about", as: "about"
  post '/users/:id', to: 'books#edit'
  post '/users/:id/edit', to: 'users#update'


  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
