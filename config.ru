$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
        if env['PATH_INFO'] == '/'
          Rack::Response.new(WelcomeController.new.index)
        elsif env['PATH_INFO']=='/users'
          Rack::Response.new(UsersController.new.index)
        else
          Rack::Response.new('Not Found',404)
        end
        # Your code goes here...
      end
    end
  end

  class BaseController
    def render(view)
      render_template('layouts/application') do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new("app/views/#{path}.html.erb").render(self,&block)
    end
  end
end

require 'app/models/user'
require 'app/controllers/users_controller'
require 'app/controllers/welcome_controller'
use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
