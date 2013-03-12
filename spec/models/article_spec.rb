require 'spec_helper'

describe Article do
  it "get image url from body" do
		FactoryGirl.create(:article)
		article = Article.first.find_img_url
		article.should eql("/ckeditor_assets/pictures/3/content_ha-ha.jpg")
	end

	it "get remote image url from body" do
		FactoryGirl.create(:article, :body => "<p><img alt=\"\" src=\"http://somehost.com/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"width: 420px; height: 304px;\" /></p>\r\n")
		article = Article.first.find_img_url
		article.should eql("http://somehost.com/ckeditor_assets/pictures/3/content_ha-ha.jpg")
	end

	it "delete width and height from body images" do
		FactoryGirl.create(:article)
		article = Article.first.scale_body_image
		article.should eql("<p><img alt=\"\" src=\"/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"\" /></p>")
	end

	it "delete width and height from remote body images" do
		FactoryGirl.create(:article, :body => "<p><img alt=\"\" src=\"http://somehost.com/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"width: 420px; height: 304px;\" /></p>\r\n")
		article = Article.first.scale_body_image
		article.should eql("<p><img alt=\"\" src=\"http://somehost.com/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"\" /></p>")
	end	
end
