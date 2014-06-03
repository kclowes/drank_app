class WelcomeController < ApplicationController
  def index
    if session[:id]
      @user = User.find(session[:id])
    end
  end

  def about
    if session[:id]
      @user = User.find(session[:id])
    end
  end
end
