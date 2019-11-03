class AdminController < ApplicationController
  before_action :admin_flg

  def index
    @users = User.all
    @poses = Pose.all
    @effects = Effect.all
    @tags = Tag.all
  end
end
