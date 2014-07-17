class PasswordResetController < ApplicationController
  def new
  end

  def edit
  end

  def index

  end

  def create
    @user = User.find_by_email(params[:email])
    @user.update!(token: SecureRandom.uuid)
    if @user
      UserMailer.forgot_password_email(@user).deliver
      flash[:notice] = "An email has been sent with instructions"
      redirect_to sessions_path
    else
      flash[:notice] = "We don't have that email...Maybe try another?"
      render :index
    end
  end

  def update

  end
end