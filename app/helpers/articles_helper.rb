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

	def scale_body_image(body)
		params = body.scan(/\width:\s\d+\w+\W\s\w+\W\s\d+\w+\W/)
		params.each do |param|
			body[param] = "" unless param.nil?
		end	
		body.split(" ")[0..99].join(" ")
	end
end
