Rails.application.routes.draw do

  # ---- Blog Services ---- #
  get 'articles/search', to: 'article#search'
  get 'articles/:title/view', to: 'article#view'
  get 'articles/:id/comments', to: 'article#comments'
  post 'articles/:id/comments', to: 'article#create_comment'

  get 'comments/:id/replies', to: 'comment#replies'
  post 'comments/:id', to: 'comment#create'

  # ---- Admin Services ---- #
  get 'articles/:id', to: 'article#show'
  get 'articles', to: 'article#index'
  post 'articles', to: 'article#create'
  put 'articles/:id', to: 'article#update'
  delete 'articles/:id', to: 'article#destroy'
  get 'articles/:id/publish', to: 'article#publish'
  get 'articles/:id/pending', to: 'article#pending'

  get 'comments', to: 'comment#index'
  get 'comments/:id', to: 'comment#show'
  delete 'comments/:id', to: 'comment#destroy'
  get 'comments/:id/publish', to: 'comment#publish'
  get 'comments/:id/reject', to: 'comment#reject'
  get 'comments/:id/pending', to: 'comment#pending'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
