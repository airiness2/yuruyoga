class AdminController < ApplicationController
  def index
    @users = User.all
    @poses = Pose.all
    @effects = Effect.all
    @tags = Tag.all
  end
end
