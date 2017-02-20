class ArticlesController < ApplicationController
include ArticlesHelper

	def index
		@articles = Article.all
	end
	def show
		@articles = Article.find(params[:id])
	end  
	def new
		@articles = Article.new
	end 

	def create 
	@articles = Article.new(article_params)
	#@articles.title = params[:article][:title]
	#@articles.body = params[:article][:body]
	@articles.save
	redirect_to article_path(@articles)
	end

	def destroy
	@articles = Article.find(params[:id])
	@articles.destroy	
	redirect_to action:  'index'
	end 
	def edit
		@articles = Article.find(params[:id])
		@articles.update(article_params)
		redirect_to article_path(@articles)
	end 

end
