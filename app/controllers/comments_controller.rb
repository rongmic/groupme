class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        #format.js
        #format.html { redirect_to group_path @topic.group }
        @comments = Comment.latest
        format.html { render partial: 'comments/comment', locals: {comment: @comment} }
        format.json { render json: @comment }

      else
        format.json { render json: "error" }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @topic = @comment.topic

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to group_path(@topic.group) }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
