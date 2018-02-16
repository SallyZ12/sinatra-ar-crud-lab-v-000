require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates a post
      @posts = Post.create(params)
      redirect to '/posts'
  end

  get '/posts' do # loads index page/shows all posts
      @posts = Post.all
      erb :index
  end

  get '/posts/:id' do #finds a single post
      @post = Post.find(params[:id])
      erb :show
  end

  get '/posts/:id/edit' do #takes you to form to edit
        @post = Post.find(params[:id])
        erb :edit
  end

  patch '/posts/:id' do #edit a post
        @post = Post.find(params[:id])
        @post.name = params[:name]
        @post.content = params[:content]
        @post.save
        erb :show
  end


  delete '/posts/:id/delete' do #delete a post
      @post = Post.find(params[:id])
      @post.destroy
      erb :delete
  end


end
