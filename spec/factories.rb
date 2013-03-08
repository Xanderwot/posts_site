FactoryGirl.define do
	factory :user do
		email "admin@example.com"
		password "qweqweqwe"
		password_confirmation "qweqweqwe"	
	end	

	factory :article do
		title "Test article"
  	body "<p><img alt=\"\" src=\"/ckeditor_assets/pictures/3/content_ha-ha.jpg\" style=\"width: 420px; height: 304px;\" /></p>\r\n"
  	user
	end	
end