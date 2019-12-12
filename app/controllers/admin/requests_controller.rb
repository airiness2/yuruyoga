class Admin::RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :admin_flg

  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result
    if params[:all_status]
      @requests = @requests.page(params[:page]).per(10)
    else
      @requests = @requests.page(params[:page]).per(10).where.not(status: "完了")
    end
  end

  def show; end

  def edit; end

  def update
    if @request.update(request_params)
      redirect_to admin_request_path, notice: "要望を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @request.destroy
    redirect_to admin_requests_path, notice: "要望を削除しました！"
  end

  private

  def request_params
    params.require(:request).permit(:body, :status, :user_id)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
