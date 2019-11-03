$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
        # Your code goes here...
        Rack::Response.new(render 'welcome/index')
      end

      def render(view)
        render_template('layouts/application') do
          render_template(view)
        end
      end

      def render_template(path, &block)
        Tilt.new("app/views/#{path}.html.erb").render(&block)
      end
    end
  end
end

use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
