class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to diary_path(@diary) }
      else
        format.html { redirect_to diary_path(@diary), notice: 'コメントを投稿できませんでした。' }
      end
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to diary_path(@diary), notice: "日記を削除しました！"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:diary_id, :content, :user_id)
  end
end
