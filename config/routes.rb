Rails.application.routes.draw do
  get 'blogs' => 'blog#index', as: 'blogs'
  post 'blogs' => 'blog#create'
  delete 'blogs/:id' => 'blog#delete'
  get 'blogs/new' => 'blog#new', as: 'new_blog'
  get 'blogs/:id' => 'blog#show', as: 'blog'
  root 'blog#index'
end
