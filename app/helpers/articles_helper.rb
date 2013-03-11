module ArticlesHelper
	
	def comments_count(article)
		article.comments.count
	end

	def edit_article(article)
		link_to "Edit", edit_article_path(article), :class => "icon-edit" if can? :update, article
	end

	def delete_article(article)
		link_to "Delete", article_path(article), :method => :delete, :class => "icon-remove", :confirm => "Are you sure?" if can? :destroy, article
	end

	def can_featured?(article)
		featured_icon(article) if can? :featured, Article
	end

	def featured_icon(article)
		if article.featured?
			link_to "Unfeatured", unfeatured_path(:id => article), :remote => true, :class => "icon-off"
		else
			link_to "Featured", featured_path(:id => article), :remote => true, :class => "icon-heart"	
		end	
	end

	def comments_text(article)
		article.comments.count == 0 ? "No comments et" : "Comments"
	end

	def delete_comment(comment)
		link_to "Delete", comment_path(comment), :method => :delete, :class => "icon-remove", :remote => true, :confirm => "Are you sure?" if can? :destroy, comment
	end

	def articles_exists?(articles)
		if articles.count == 0
			"No any article found"
		else
			render :partial => "articles"
		end		
	end
end
