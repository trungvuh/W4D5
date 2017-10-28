class UsersController < ApplicationController
  before_action :require_logged_out

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
