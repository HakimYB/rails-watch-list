Rails.application.routes.draw do
  root to: 'lists#home'

  resources :lists, only: [:index, :show, :new, :create ] do
    resources :bookmarks, only: [:new, :create, :index, :destroy ]
    root to: 'bookmarks#home'
  end
end
