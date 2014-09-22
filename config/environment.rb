# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Treebook::Application.initialize!

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV[''],
    :password => ENV[''],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}