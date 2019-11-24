class Router
  ROUTES = {
    '/' => 'WelcomeController#index',
    '/users' => 'UsersController#index'
  }
end
