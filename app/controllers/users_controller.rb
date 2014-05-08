class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.create(:email => params[:user][:email],
                         :password => params[:user][:password])
    session[:id] = @users.id
    redirect_to users_path
  end


  def index
    id = session[:id]
    @user = User.find(id)
  end

  def logout
    session.clear
    redirect_to '/'
  end
end
