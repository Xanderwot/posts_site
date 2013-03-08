class CommentsController < ApplicationController
	load_and_authorize_resource

	respond_to :js

	def create
		@comment.update_attributes(params[:comment])
		@comment.update_attribute(:user_id, current_user.id)
		@comment.save
		@article = @comment.article
	end
end
