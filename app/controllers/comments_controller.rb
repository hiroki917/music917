class CommentsController < ApplicationController
  def create
   @comment =Comment.create(comment_params)
   if @comment.save 
    redirect_to music_path(@comment.music.id)
   else
     @music = @comment.music
     @comments = @music.comments
     render "musics/show"
  end
end

  private

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, music_id: params[:music_id])
  end

end
