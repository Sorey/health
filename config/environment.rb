# Load the Rails application.
require File.expand_path('../application', __FILE__)


# Initialize the Rails application.
Rails.application.initialize!

require 'carrierwave/orm/activerecord'

# Recaptcha.configure do |config|
#   config.public_key  = 'gg3434f3gv5353f2'
#   config.private_key = 'gg3434f3gv5353f21'
# end
# ENV_RECAPTCHA_PUBLIC_KEY= 'gg3434f3gv5353f2'
# ENV_RECAPTCHA_PRIVATE_KEY= 'gg3434f3gv5353f21'
# ENV['RECAPTCHA_PUBLIC_KEY']  = '6LfPjAQTAAAAAHIcZm6r***************'
# ENV['RECAPTCHA_PRIVATE_KEY'] = '6LfPjAQTAAAAALfyn4pu***************'