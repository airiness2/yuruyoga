class AdminController < ApplicationController
  before_action :admin_flg

  def index
    @users = User.all.limit(5)
    @poses = Pose.all.limit(5)
    @effects = Effect.all.limit(5)
    @tags = Tag.all.limit(5)
    @requests = Request.where(status: '対応中').or(Request.where(status: '未着手')).order(created_at: :desc).limit(3)
  end
end
