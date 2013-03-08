class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

  attr_accessible :title, :body, :user_id

  validates :title, :body, :presence => true

  public
  	def find_img_url
  		body.scan(/\/\w+\/\w+[\/][\w]+[\W][\w\-]+\.\w+/).first
  	end
end
