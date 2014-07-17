class TokenController < ApplicationController
  def index

  end

  def create
    user = User.find_by_token(params[:token])
    if user
      redirect_to "/token/#{user.token}"
    else
      flash[:notice] = 'We couldn\'t find you...'
      render :index
    end
  end
end