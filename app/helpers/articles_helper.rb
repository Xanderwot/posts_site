module ArticlesHelper
	
	def comments_count(article)
		article.comments.count
	end

	def edit_article(article)
		link_to "Edit this article", edit_article_path(article) if can? :update, article
	end
end
