class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    if @user == current_user
      render 'mypage'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
