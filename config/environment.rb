# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PostsSite::Application.initialize!

ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  user_name:            'postssite@gmail.com',
  password:             ',jkmijqgfhjkm',
  authentication:       'plain',
  enable_starttls_auto: true
}