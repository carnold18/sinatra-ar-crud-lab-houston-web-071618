
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

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to '/articles'
  end


 #READ

  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #UPDATE

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
  	erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    # binding.pry
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
    erb :show
  end

  #DELETE

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    # binding.pry
    @article.delete
    redirect to '/articles'
  end


end
