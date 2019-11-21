class AdminController < ApplicationController
  before_action :admin_flg

  def index
    @users = User.all.limit(10)
    @poses = Pose.all.limit(10)
    @effects = Effect.all.limit(10)
    @tags = Tag.all.limit(10)
  end
end
