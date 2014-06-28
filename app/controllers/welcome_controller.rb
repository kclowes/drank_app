class WelcomeController < ApplicationController
  before_action :set_user_by_session, :only => [:index, :about]
  helper_method :set_user_by_session

  def index
    set_user_by_session
  end

  def about
    set_user_by_session
  end

  private

  def set_user_by_session
    if session[:id]
      User.find(session[:id])
    end
  end

end
