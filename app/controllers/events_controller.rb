class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :prohibit_editing, only: [:edit, :destroy]

  def index
    @events = Event.all.page(params[:page]).per(10)
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path, notice: "イベントを作成しました!"
    else
      render 'new'
    end
  end

  def show;end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "イベントを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "イベントを削除しました！"
  end

  def confirm
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  private

  def event_params
    params.require(:event).permit(:name, :user_id, :hold_date, :place, :url, :detail)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def prohibit_editing
    if @event.user != current_user
      redirect_to event_path(@event), notice: '自分以外が投稿したイベントを編集することは出来ません'
    end
  end
end
