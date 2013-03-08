class HomeController < ApplicationController
	layout "home"
	respond_to :js

	def index
		@articles = Article.order("created_at DESC").limit(10)
		@carousels = Article.where(:featured => true)
	end
end
