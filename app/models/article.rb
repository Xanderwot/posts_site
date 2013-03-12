class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

  attr_accessible :title, :body, :user_id

  validates :title, :body, presence: true

  public
  	def find_img_url
  		body.scan(/http:\W+[\w\W]+[\.]\w+/).first || body.scan(/\/\w+\/\w+[\/][\w]+[\W][\w\-]+\.\w+/).first
  	end

  	def scale_body_image
			width = body.scan(/\width:\s\d+\w+\W\s/)
			height = body.scan(/height:\s\d+\w+\W/)
			width.each do |param|
				body[param] = "" unless param.nil?
		end
			height.each do |param|
				body[param] = "" unless param.nil?
		end
			body.split(" ")[0..99].join(" ")
	end
end
