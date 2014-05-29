class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.new(:email => params[:user][:email],
                      :password => params[:user][:password])
    if @users.save
      session[:id] = @users.id
      redirect_to users_path
    else
      render 'users/new'
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
end