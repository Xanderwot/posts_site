class ArticlesController < ApplicationController
	load_and_authorize_resource
	
	def index
		@articles = Article.order("created_at DESC")
	end

	def create
		@article.update_attribute(:user_id, current_user.id)
		@article.save
		respond_with @article
	end

	def update
		@article.update_attributes(params[:article])
		respond_with @article
	end
end
