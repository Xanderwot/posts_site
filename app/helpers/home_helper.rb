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

	def carousel_image(article)
		unless article.find_img_url.nil?
			image_tag article.find_img_url
		else
			image_tag "/ckeditor_assets/pictures/4/content_17_1v2.jpg"
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
