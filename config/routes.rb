Rails.application.routes.draw do
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :memos
  resources :words

  root :to => 'homes#top'
  get "home/about" => 'homes#about'

  get "search" => 'words#search'
end
