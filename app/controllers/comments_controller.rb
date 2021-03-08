class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_post
  
  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        comment = Comment.new
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(dom_id(@post, comment), partial: "comments/form", locals: { comment: comment, post: @post })
        }
        format.html { redirect_to @post }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(dom_id(@post, @comment), partial: "comments/form", locals: { comment: @comment, post: @post })
        }
        format.html { redirect_to @post }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      #format.turbo_stream {}
      format.html { redirect_to @comment.post }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
