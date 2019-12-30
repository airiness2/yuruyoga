class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    if params[:user][:password].blank?
      params[:user].delete('password')
    end
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを更新しました！'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :remove_avatar)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
