module ArticlesHelper
	
	def comments_count(article)
		article.comments.count
	end

	def edit_article(article)
		link_to "Edit this article", edit_article_path(article) if can? :update, article
	end

	def can_featured?(article)
		featured_icon(article) if can? :featured, Article
	end

	def featured_icon(article)
		if article.featured?
			link_to "", unfeatured_path(:id => article), :remote => true, :class => "icon-off"
		else
			link_to "", featured_path(:id => article), :remote => true, :class => "icon-heart"	
		end	
	end

	def comments_text(article)
		article.comments.count == 0 ? "No comments et" : "Comments"
	end
end
