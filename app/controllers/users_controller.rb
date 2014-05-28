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

    #def login
    #  @user = User.find_by_email(params[:email])
    #  if @user.password == params[:password]
    #    give_token
    #  else
    #    redirect_to home_url
    #  end
    #end

    #def create
    #  @user = User.new(params[:user])
    #  @user.password = params[:password]
    #  @user.save!
    #end


    def index
      id = session[:id]
      @user = User.find(id)
    end

    def logout
      session.clear
      redirect_to '/'
    end
    #
    #def show
    #  id = session[:id]
    #  @user = User.find(id)
    #end

  end
end