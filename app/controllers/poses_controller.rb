class PosesController < ApplicationController
  def index
    @q = Pose.ransack(params[:q])
    @poses = @q.result.order(created_at: :desc)
    @poses = @poses.page(params[:page]).per(10)
  end

  private

  def pose_params
    params.require(:pose).permit(:name, :detail, :sans_name, :image)
  end

  def set_pose
    @pose = Pose.find(params[:id])
  end
end
