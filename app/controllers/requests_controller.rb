class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update]

  def show;end

  def edit; end

  def update
    if @request.update(request_params)
      redirect_to request_path(@request), notice: "要望を送信しました。"
    else
      render 'edit'
    end
  end

  private

  def request_params
    params.require(:request).permit(:body, :status, :user_id)
  end

  def set_request
    @request = request.find(params[:id])
  end
end
