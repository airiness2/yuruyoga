class Admin::PosesController < ApplicationController
  before_action :set_pose, only: [:show, :edit, :update, :destroy]
  before_action :admin_flg

  def index
    @poses = Pose.all.page(params[:page]).per(10)
  end

  def new
    if params[:back]
      @pose = Pose.new(pose_params)
    else
      @pose = Pose.new
      @pose.effectings.build
    end
  end

  def create
    @pose = Pose.new(pose_params)
    if @pose.save
      redirect_to admin_poses_path, notice: "ポーズを作成しました!"
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if params[:pose][:effect_ids].blank?
      params[:pose].delete(:effect_ids)
    end
    if @pose.update(pose_params)
      redirect_to admin_pose_path, notice: "ポーズを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @pose.destroy
    redirect_to admin_poses_path, notice: "ポーズを削除しました！"
  end

  private

  def pose_params
    params.require(:pose).permit(:name, :detail, :sans_name, :image, :image_cache, effect_ids: [])
  end

  def set_pose
    @pose = Pose.find(params[:id])
  end
end
