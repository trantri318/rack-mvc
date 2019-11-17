$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
        if env['PATH_INFO'] == '/'
          Rack::Response.new(render 'welcome/index')
        elsif env['PATH_INFO']=='/users'
          @users = ['toan','son','tam','tu','tri']
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

class UsersController < Frack::BaseController
  def index
    @users = %w(Toan Tri Son Tu Tam)
    render('users/index')
  end
end

use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
