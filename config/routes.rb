Rails.application.routes.draw do
  get 'bookmarks/new'
  root 'lists#index'

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy]
end
