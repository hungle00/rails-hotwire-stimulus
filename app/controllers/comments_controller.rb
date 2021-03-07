class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_post
  
  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        comment = Comment.new
        #format.turbo_stream {
        #  render turbo_stream: turbo_stream.replace(dom_id_for_records(@commentable, comment), partial: "comments/form", locals: { comment: comment, commentable: @commentable })
        #}
        format.html { redirect_to @post }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace( dom_id(@post, @comment), partial: "comments/form", locals: { comment: @comment, post: @post })
        }
        format.html { redirect_to @post }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
