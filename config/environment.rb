# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['MAILJET_LOGIN'],
  :password => ENV['MAILJET_PWD'],
  :domain => 'cutecatshop.fr',
  :address => 'in-v3.mailjet.com',
  :tls => true,
  :port => '465',
  :authentication => :plain,
  :enable_starttls_auto => true
}

# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey',
#   :password => ENV['SENDGRID_PWD'],
#   :domain => 'monsite.fr',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

