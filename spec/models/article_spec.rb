require 'spec_helper'

describe Article do
  it "get image url from body" do
		FactoryGirl.create(:article)
		article = Article.first.find_img_url
		article.should eql("/ckeditor_assets/pictures/3/content_ha-ha.jpg")
	end

	it "delete width and height from body images" do
		FactoryGirl.create(:article)
		article = Article.first.scale_body_image
		article.should eql("<p><img alt=\"\" src=\"/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"\" /></p>")
	end	
end
