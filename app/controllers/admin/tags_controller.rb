class Admin::TagsController < ApplicationController
  include ApplicationHelper

  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :admin_flg

  def index
    @tags = Tag.all
  end

  def new
    if params[:back]
      @tag = Tag.new(tag_params)
    else
      @tag = Tag.new
    end
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "タグを作成しました!"
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "タグを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, notice: "タグを削除しました！"
  end

  private

  def tag_params
    params.require(:tag).permit(:name, diary_ids: [])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def admin_flg
    raise Forbidden unless user_signed_in? && current_user.admin?
  end
end
