Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # ---- Blog Services ---- #
  post 'articles/:lang/search/(:page)', to: 'article#search'
  get 'articles/:lang/:permalink/view', to: 'article#view'
  get 'articles/:id/comments/(:page)', to: 'article#comments'
  post 'articles/:id/comments', to: 'article#create_comment'

  get 'comments/:id/replies', to: 'comment#replies'
  # post 'comments/:id', to: 'comment#create'

  # ---- Admin Services ---- #
  get 'articles/:id', to: 'article#show'
  get 'articles/all/(:page)', to: 'article#index'
  post 'articles', to: 'article#create'
  put 'articles/:id', to: 'article#update'
  # delete 'articles/:id', to: 'article#destroy'
  get 'articles/:id/publish', to: 'article#publish'
  get 'articles/:id/unpublish', to: 'article#unpublish'
  #
  # get 'comments', to: 'comment#index'
  # get 'comments/:id', to: 'comment#show'
  # delete 'comments/:id', to: 'comment#destroy'
  # get 'comments/:id/publish', to: 'comment#publish'
  # get 'comments/:id/reject', to: 'comment#reject'
  # get 'comments/:id/pending', to: 'comment#pending'

  get 'practice_areas', to: 'practice_area#index'

  get 'tags', to: 'tag#index'
  post 'tags', to: 'tag#create'
  put 'tags/:id', to: 'tag#update'
  delete 'tags/:id', to: 'tag#destroy'

  get 'users/profile', to: 'user#profile'
  get 'users', to: 'user#index'
  post 'users', to: 'user#create'
  get 'users/:id', to: 'user#show'
  put 'users/:id', to: 'user#update'
  delete 'users/:id', to: 'user#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
