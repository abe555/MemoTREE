Rails.application.routes.draw do

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :words, expect: [:new, :show]
  resources :memos, expect: [:new, :show]
  resources :tags, only: [:show, :index]

  root :to => 'homes#top'
  get "home/about" => 'homes#about'

  get 'mypage' => 'users#show', as: 'mypage'
  get 'mypage/edit' => 'users#edit', as:'edit_mypage'
  patch 'mypage' => 'users#update', as: 'update_mypage'

  get "search" => 'search#search'
  get "memos_sort" => 'search#memosort'
  get "words_sort" => 'search#wordsort'
  get '/post/tag/:name', to: "memos#hashtag"
  get 'pickup' => 'pickup#index'
end
