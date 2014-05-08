class SessionsController < ApplicationController
  def new
    @sessions = Session.new
  end

  def create
    password = params[:session][:password]
    email = params[:session][:email]
    @user = User.find_by(:email => email)
    if email == @user.email && password == @user.password
      session[:id] = @user.id
      redirect_to '/users'
    else
      render 'sessions/new'
    end
  end
end