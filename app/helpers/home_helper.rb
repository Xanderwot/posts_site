module HomeHelper
	
	# def edit_article(article)
	# 	link_to "Edit", edit_article_path(article), :class => "icon-edit" if can? :update, article
	# end

	def carousel_active_class(index)
		"class=active" if index == 0
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

	def render_carousel
		render "carousel" if Article.where(:featured => true).count > 0
	end
end
