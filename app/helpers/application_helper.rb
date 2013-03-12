module ApplicationHelper
	def hide_registration_link(current_user)
		link_to "Register", new_user_registration_path if current_user.nil?
	end

	def sign_in_link(current_user)
		if current_user.nil?
			link_to "Sign in", new_user_session_path
		else
			link_to "Sign out", destroy_user_session_path, :method => :delete
		end
	end

	def new_article_link
		link_to "New Article", new_article_path if can? :create, Article
	end
end
