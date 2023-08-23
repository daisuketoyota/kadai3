Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :users, except: [:new ,:show, :edit, :update]
  resources :books, except: [:new ]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # 以下の行のonly: []内にupdateを追加
  resources :users, only: [:show, :edit, :update]
end
