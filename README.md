Challenges
As a developer, I have been commissioned to create an application where a user can see and create blog posts.

As a developer, I can create a full-stack Rails application.
As a developer, my blog post can have a title and content.
As a developer, I can add new blog posts directly to my database.
As a user, I can see all the blog titles listed on the home page of the application.
As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.
As a user, I can navigate from the show page back to the home page.
As a user, I see a form where I can create a new blog post.
As a user, I can click a button that will take me from the home page to a page where I can create a blog post.
As a user, I can navigate from the form back to the home page.
As a user, I can click a button that will submit my blog post to the database.
As a user, I when I submit my post, I am redirected to the home page.

blog_controller.rb File

class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def show
    @blog = Blog.find(params[:id])
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.create(blog_params)
    if @blog.valid?
      redirect_to blogs_path
    end
  end
  def delete
    @blog = Blog.find(params[:id]).destroy
    redirect_to blogs_path
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end

routes.rb File

Rails.application.routes.draw do
  get 'blogs' => 'blog#index', as: 'blogs'
  post 'blogs' => 'blog#create'
  delete 'blogs/:id' => 'blog#delete', as: 'delete_blog'
  get 'blogs/new' => 'blog#new', as: 'new_blog'
  get 'blogs/:id' => 'blog#show', as: 'blog'
  root 'blog#index'
end

index.html.erb File
<h1> My Blogs </h1>
<ul>
  <% @blogs.each do |value| %>
    <li>
      <%= link_to value.title, blog_path(value) %>
    </li>
  <% end %>
<br>
<footer> <%= link_to 'Add a Blog Post', new_blog_path %> </footer>
</br>
</ul>

show.html.erb File

<h1> Blog Name: <%= @blog.title %> </h1>

<p> <%= @blog.content %> </p>

<br>
<%= link_to 'Back to Blog Posts', blogs_path %>
</br>


<br>
<%= button_to "Delete Post", { action: "delete", id: @blog.id }, method: :delete %>
</br>


new.html.erb File

<h1> Create a New Blog Post </h1>
<%= form_with model:@blog do |form| %>
  <%= form.label :title %>
  <%= form.text_field :title %>
<br>
  <%= form.label :content %>
  <%= form.text_field :content %>
</br>
<br>
  <%= form.submit 'Add Blog Post' %>
</br>
<% end %>

<br>
<%= link_to 'Back to Blog Posts', blogs_path %>
</br>


Stretch Challenges
As a user, I can delete my blog post.

blog.controller.rb File

def delete
  @blog = Blog.find(params[:id]).destroy
  redirect_to blogs_path
end

routes.rb File

delete 'blogs/:id' => 'blog#delete'

show.html.erb File

<%= button_to "Delete Post", { action: "delete", id: @blog.id }, method: :delete %>


As a user, I can update my blog post.


As a developer, I can ensure that all blog posts have titles and content for each post.
As a developer, I can ensure that all blog post titles are unique.
As a developer, I can ensure that blog post titles are at least 10 characters.
