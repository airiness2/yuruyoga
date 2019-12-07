class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :prohibit_editing, only: [:edit, :destroy]

  def index
    @diaries = Diary.all.where(user: current_user)
    @user = current_user
    @rankings =  Diary.joins(:pose).group("poses.name").select("pose_id, rank").limit(10).sum(:rank)
    @items = RakutenWebService::Ichiba::Genre[501880].ranking
  end

  def search
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
    if params[:pose_id]
      @diary.pose_id = params[:pose_id]
    end
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to search_diaries_path, notice: "日記を作成しました!"
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
      redirect_to diary_path(@diary), notice: "日記を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @diary.destroy
    redirect_to search_diaries_path, notice: "日記を削除しました！"
  end

  def confirm
    @diary = Diary.new(diary_params)
    render :new if @diary.invalid?
  end

  def ranking
    @graphs =  Diary.joins(:pose).group("poses.name").select("pose_id, rank").sum(:rank)
    @like_poses =  Diary.joins(:pose).group("poses.name").select("sum(rank) as pose_rank, poses.name").order("pose_rank").limit(10)
    @unlike_poses =  Diary.joins(:pose).group("poses.name").select("sum(rank) as pose_rank, poses.name").order("pose_rank DESC").limit(10)
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :worked_date, :body, :rank, :image, :pose_id, :image_cache, :user_id, :remove_image, tag_ids: [])
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def prohibit_editing
    if @diary.user != current_user
      redirect_to diary_path(@diary), notice: '自分以外の日記を編集することは出来ません'
    end
  end
end
