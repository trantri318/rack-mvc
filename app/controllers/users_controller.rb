class UsersController < Frack::BaseController
  def index
    @users = User.all
    render('users/index')
  end

  def new
    @user = User.new
    render('users/new')
  end

  def create
    @user = User.new user_params
    if user.save
      render('user/index')
    else
      render('user/new')
    end
  end

  private
  def user_params
    
  end

end
