class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

  attr_accessible :title, :body, :featured

  validates :title, :body, presence: true
end
