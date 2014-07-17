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

  def edit
    @user = User.find_by_token(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(allowed_parameters)
      session[:id] = @user.id
      flash[:notice] = "Your password has been updated"
      redirect_to about_path
    else
      render :edit
      flash[:notice] = 'Password cannot be blank'
    end
  end


  def allowed_parameters
    params.require(:user).permit(
      :email,
      :password,
    )
  end
end