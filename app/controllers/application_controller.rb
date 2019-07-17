
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#INITIATE DATABASE BY CREATING A MIGRATION. ALSO NEED TO CREATE A CLASS TO MOVE THE MIGRATION INTO.
#START REST METHOD

 #CREATE

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    binding.pry
    @post = Post.create(params)
    redirect to '/posts'
  end


 #READ

  get '/posts' do 
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #UPDATE

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
  	erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    # binding.pry
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  #DELETE

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    # binding.pry
    @post.delete
    redirect to '/posts'
  end

end
