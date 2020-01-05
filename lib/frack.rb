$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

ENV['APP_ENV'] || 'development'

require 'rack'
require 'tilt'
require 'erb'
require 'active_record'
require 'byebug'

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
