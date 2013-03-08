module HomeHelper
	
	def edit_article(article)
		link_to "Edit this article", edit_article_path(article) if can? :update, article
	end

	def carousel_active_class(index)
		"class='active'" if index == 0
	end

	def carousel_active_item(index)
		if index == 0
			"active item"
		else
			"item"	
		end	
	end
end
