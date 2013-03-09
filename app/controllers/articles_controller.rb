class ArticlesController < ApplicationController
	load_and_authorize_resource

	respond_to :js, :only => [ :featured_article, :unfeatured_article ]
	
	def index
		@search = Article.search(params[:search])
		@articles = @search.paginate	:page => params[:page], 
                                  :order => 'created_at desc',
                                  :per_page => 10                             
	end

	def create
		@article.update_attributes(:user_id => current_user.id)
		@article.save
		respond_with @article
	end

	def update
		@article.update_attributes(params[:article])
		respond_with @article
	end

	def destroy
		@article.destroy
		respond_with @article
	end

	def featured_article
		@articles = Article.paginate	:page => params[:page], 
                                  :order => 'created_at desc',
                                  :per_page => 10
		if (less_than_five?) && (can? :featured, @article)
			@article.update_attribute(:featured, true)
		else
			flash[:error] = "Can't featured more than four articles"
		end		
	end

	def unfeatured_article
		@articles = Article.paginate	:page => params[:page], 
                                  :order => 'created_at desc',
                                  :per_page => 10
		@article.update_attribute(:featured, false) if can? :featured, @article
	end

	def less_than_five?
  	if Article.where(:featured => true).count < 4
  		true
  	else
  		false
  	end		
	end
end
