class PosesController < ApplicationController
  def index
    @poses = Pose.all.page(params[:page]).per(10)
  end

  private

  def pose_params
    params.require(:pose).permit(:name, :detail, :sans_name, :image)
  end

  def set_pose
    @pose = Pose.find(params[:id])
  end
end
