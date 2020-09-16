Rails.application.routes.draw do

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :memos
  resources :words

  root :to => 'homes#top'
  get "home/about" => 'homes#about'

  get 'mypage' => 'users#show', as: 'mypage'
  get 'mypage/edit' => 'users#edit', as:'edit_mypage'
  patch 'mypage' => 'users#update', as: 'update_mypage'

  get "search" => 'search#search'
end
