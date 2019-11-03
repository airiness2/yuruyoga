class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @q = Diary.ransack(params[:q])
    @diaries = @q.result.order(created_at: :desc)
    if params[:all_user]
      @diaries = @diaries.page(params[:page]).per(10)
    else
      @diaries = @diaries.page(params[:page]).per(10).where(user: current_user)
    end
  end

  def new
    if params[:back]
      @diary = Diary.new(diary_params)
    else
      @diary = Diary.new
      @diary.taggings.build
    end
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diaries_path, notice: "日記を作成しました!"
    else
      render 'new'
    end
  end

  def show
    @comments = @diary.comments
    @comment = @diary.comments.build
  end

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
    params.require(:diary).permit(:title, :worked_date, :body, :rank, :image, :pose_id, :image_cache, :user_id, tag_ids: [])
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

end
