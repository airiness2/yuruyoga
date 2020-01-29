class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_flg

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'ユーザを作成しました!'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @user.skip_confirmation!
    if @user.update_without_current_password(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザを編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザを削除しました！'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :admin, :avatar_cache,
                                 :confirmed_at, :remove_avatar, :password)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def destroy_self
    if @user == current_user
      redirect_to admin_users_path, notice: '自身を削除することは出来ません'
    end
  end
end
