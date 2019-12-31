class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user), notice: 'プロフィールを更新しました！'
    elsif @user.update_without_current_password(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを更新しました！'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :remove_avatar, :password, :avatar_cache)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
