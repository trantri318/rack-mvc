$LOAD_PATH << '.'
require 'lib/frack'
require 'app/models/user'
require 'app/controllers/users_controller'
require 'app/controllers/welcome_controller'

use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
use Frack::Router

run Frack::Application
