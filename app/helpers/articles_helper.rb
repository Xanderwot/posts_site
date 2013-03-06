module ArticlesHelper
	def comments_count(article)
		article.comments.count
	end
end
