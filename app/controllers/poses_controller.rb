class PosesController < ApplicationController
  before_action :set_pose, only: [:show]
  before_action :authenticate_user!

  def index
    @q = Pose.ransack(params[:q])
    @poses = @q.result.order(created_at: :desc)
    @poses = @poses.page(params[:page]).per(10)

    session[:title] = params[:t]
    session[:date] = params[:d]
    session[:body] = params[:b]
    session[:rank] = params[:r]
  end

  def show; end

  def auto_complete
    @poses = if params[:term] =~ /\s*/
               pose_input = params[:term]
               poses = Pose.select('id, name').where("name LIKE '%#{pose_input}%'")
               poses.map { |pose| { id: "#{pose.id}", name: "#{pose.name}" } }
             end
    render json: @poses.to_json
  end

  private

  def pose_params
    params.require(:pose).permit(:name, :detail, :sans_name, :image)
  end

  def set_pose
    @pose = Pose.find(params[:id])
  end
end
