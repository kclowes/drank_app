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