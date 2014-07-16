class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.new(allowed_parameters)
    if @users.save
      session[:id] = @users.id
      redirect_to users_path
    else
      render 'users/new'
    end
  end

  def edit

  end

  def update
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.forgot_password_email(@user).deliver
    end
    flash[:notice] = "An email has been sent with instructions"
    redirect_to sessions_path
  end

  def index
    id = session[:id]
    @user = User.find(id)
  end

  def logout
    session.clear
    redirect_to '/about'
  end

  def allowed_parameters
    params.require(:user).permit(
      :email,
      :password,
    )
  end
end