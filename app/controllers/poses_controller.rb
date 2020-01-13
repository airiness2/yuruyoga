class PosesController < ApplicationController
  before_action :set_pose, only: [:show]
  before_action :authenticate_user!

  def index
    @q = Pose.ransack(params[:q])
    @poses = @q.result.order(created_at: :desc)
    @poses = @poses.page(params[:page]).per(10)
    if params[:p] == 'tp'
      session[:diary_worked_date] = '2020/01/13'
      session[:diary_title] = 'ポーズから戻るタイトル'
      session[:diary_rank] = 5
      session[:diary_body] = 'ポーズから戻る本文'
    end
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
