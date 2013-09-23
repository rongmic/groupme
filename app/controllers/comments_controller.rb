class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to group_path @topic.group }
        format.js
      else
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    group = @comment.topic.group

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to group_path(group) }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
