class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:back]
      @request = Request.new(request_params)
    else
      @request = Request.new
    end
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to root_path, notice: "要望を送信しました!"
    else
      render 'new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:body, :status, :user_id)
  end
end
