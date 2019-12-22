$LOAD_PATH << '.'
require 'lib/frack'
require 'app/controllers/users_controller'
require 'app/controllers/welcome_controller'
require 'byebug'

use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
use Frack::Router

run Frack::Application
