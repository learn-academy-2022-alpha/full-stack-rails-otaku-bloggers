Rails.application.routes.draw do
  Rails.application.routes.draw do
    get 'blogs' => 'blog#index', as: 'blogs'
    post 'blogs' => 'blog#create'
    patch 'blogs/:id' => 'blog#update'
    get 'blogs/:id/edit' => 'blog#edit', as: 'editpost'
    delete 'blogs/:id' => 'blog#delete'
    get 'blogs/new' => 'blog#new', as: 'new_blog'
    get 'blogs/:id' => 'blog#show', as: 'blog'
    root 'blog#index'
  end
end
