class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if true || @comment.save
        format.js
        format.html { redirect_to group_path @topic.group }
      else
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
