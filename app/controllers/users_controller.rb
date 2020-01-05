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
      flash[:success] = 'Register success'
      render('user/index')
    else
      flash[:errors] = 'Reister failed'
      render('user/new')
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :password, :password_confirmation
  end  

end
