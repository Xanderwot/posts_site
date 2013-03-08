class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

  attr_accessible :title, :body, :user_id

  validates :title, :body, :presence => true

  public
  	def find_img_url
  		body.scan(/\/\w+\/\w+[\/][\w]+[\W][\w\-]+\.\w+/).first
  	end

  	def scale_body_image
		params = body.scan(/\width:\s\d+\w+\W\s\w+\W\s\d+\w+\W/)
		params.each do |param|
			body[param] = "" unless param.nil?
		end	
		body.split(" ")[0..99].join(" ")
	end
end
