class SessionsController < ApplicationController
  def new

  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      session[:id] = user.id
      redirect_to '/users'
    else
      @errors = "Email/password combination invalid"
      render 'sessions/new'
    end
  end
end