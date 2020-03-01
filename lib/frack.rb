$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

ENV['APP_ENV'] || 'development'

require 'dotenv/load'
require 'rack'
require 'tilt'
require 'erb'
require 'active_record'
require 'byebug'
require 'action_mailer'
ActionMailer::Base.prepend_view_path(File.expand_path('../app/views/', __dir__))
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  domain: 'localhost:3000',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       ENV['SENDGRID_API_KEY']
}

require_relative '../app/mailers/application_mailer'
require_relative '../app/mailers/user_mailer'

ActiveRecord::Base.logger = Logger.new(STDOUT)
require_relative '../config/database'

require_relative '../app/validators/category_validator'

require_relative '../app/models/user'
require_relative '../app/models/product'
require_relative '../app/models/order'
require_relative '../app/models/order_detail'
require_relative '../app/models/category'

module Frack
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
  autoload :Router, 'frack/router'
end

require_relative '../app/controllers/users_controller'
require_relative '../app/controllers/welcome_controller'
require_relative '../app/controllers/products_controller'
