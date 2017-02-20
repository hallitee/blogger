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
	flash.notice = "Article '#{@articles.title}' Created"

	redirect_to article_path(@articles)
	end

	def destroy
	@articles = Article.find(params[:id])
	@articles.destroy	
	flash.notice = "Article '#{@articles.title}' Delete "
	redirect_to action:  'index'
	end 
	
	def edit
		@articles = Article.find(params[:id])

	end 
	
	def update
	@articles = Article.find(params[:id])
	@articles.update(article_params)
	flash.notice = "Article '#{@articles.title}' updated "
	redirect_to article_path(@articles)
	end
end
