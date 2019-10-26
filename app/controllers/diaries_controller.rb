class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @diaries = Diary.all
  end

  def new
    if params[:back]
      @diary = Diary.new(diary_params)
    else
      @diary = Diary.new
    end
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diaries_path, notice: "日記を作成しました!"
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: "日記を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: "日記を削除しました！"
  end

  def confirm
    @diary = Diary.new(diary_params)
    render :new if @diary.invalid?
  end


  def autocomplete_pose
    pose_suggestions = Pose.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json {
        render json: pose_suggestions
      }
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :worked_date, :body, :rank, :image, :pose_id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

end
