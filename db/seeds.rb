# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all
Article.populate 20 do | article |
  article.title = Populator.words(2..6)
  article.body = Populator.sentences(10..40)
  article.user_id = 1
end
%w[admin newsmaker comentator].each do |role|
	User.create!(:email => "#{role}@example.com", :password => "qweqweqwe", :password_confirmation => "qweqweqwe")
	User.last.update_attribute(:role, "#{role}")
end	
