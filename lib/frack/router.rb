module Frack
  class Router
    attr_reader :app
    ROUTES = [
      {
        request_method: 'get',
        request_path: '/',
        mapping: 'WelcomeController#index'
      },
      {
        request_method: 'get',
        request_path: '/sign_up',
        mapping: 'UsersController#new'
      },
      {
        request_method: 'post',
        request_path: '/sign_up',
        mapping: 'UsersController#create'
      },
      {
        request_method: 'get',
        request_path: '/products/new',
        mapping: 'ProductsController#new'
      },
      {
        request_method: 'post',
        request_path: '/products/new',
        mapping: 'ProductsController#create'
      }
    ]

    def initialize(app)
       @app = app
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      request_path = env['REQUEST_PATH']
      route = ROUTES.find {|i| i[:request_method] == request_method.downcase && i[:request_path] == request_path}

      if route
        mapping = route[:mapping]
        env.merge!(controller_action(mapping))
        app.call(env)
      else
        Rack::Response.new('Not found', 404)
      end
    end

    def controller_action(mapping)
       Hash[%w(controller action).zip mapping.split('#')]
    end
  end
end
