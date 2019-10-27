$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
        # Your code goes here...
        ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
      end
    end
  end
end

use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
