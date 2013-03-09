Given(/^the user "(.*?)" has an account$/) do |user|
  User.create!(:email => "#{user}@example.com", :password => "qweqweqwe", :password_confirmation => "qweqweqwe")
  User.last.update_attribute(:role, user)
end

Given(/^article "(.*?)" with content "(.*?)" is exist$/) do |title, content|
  Article.create!(:title => title, :body => content, :user_id => User.last.id)
end

Given(/^comment with content "(.*?)" is exist$/) do |content|
  Comment.create!(:content => content, :article_id => Article.last.id)
  Comment.last.update_attribute(:user_id, User.last.id)
end

When(/^I login in as "(.*?)"$/) do |user|
	visit(root_path)
	click_link 'Sign in'
	within("#new_user") do
	  fill_in 'user_email', :with => "#{user}@example.com"
	  fill_in 'user_password', :with => "qweqweqwe"
  end
  click_button 'Sign in'
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content (text)
end

When(/^I create article with title "(.*?)" and content "(.*?)"$/) do |title, content|
  click_link "New Article"
  fill_in "article_title", :with => title
  browser = page.driver.browser
	browser.execute_script("CKEDITOR.instances['article_body'].setData('#{content}');")
  find_by_id("cke_9").click
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content (content)
end

When(/^I edit article with new title "(.*?)" and content "(.*?)"$/) do |title, content|
  click_link "Edit"
  fill_in "article_title", :with => title
  browser = page.driver.browser
  browser.execute_script("CKEDITOR.instances['article_body'].setData('#{content}');")
  find_by_id("cke_9").click
end

When(/^I delete existed article$/) do
  visit articles_path
  click_link('Delete')
  page.driver.browser.switch_to.alert.accept
  sleep 2
end

Then(/^I shoul not see any articles$/) do
  Article.count.should == 0
end

When(/^I add comment contains "(.*?)" to article$/) do |content|
  visit articles_path
  click_link "Show details"
  fill_in "comment_content", :with => content
  click_button "Save Comment"
end

When(/^I delete comment$/) do
  visit articles_path
  click_link "Show details"
  click_link "Delete"
  page.driver.browser.switch_to.alert.accept
  sleep 2
end

