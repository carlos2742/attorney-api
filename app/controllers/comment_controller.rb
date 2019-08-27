class CommentController < ApplicationController

  before_action :set_comment, only: [:create, :show, :update, :destroy, :publish, :reject, :pending]

  # ---- Blog Services ---- #
  def replies
    @comments = Comment.comment.published.where(reference_id: params[:id]).take(2)
    render json:@comments, status: :ok
  end

  def create
    render status: :created if @comment.create_comment(comment_params)
  end

  # ---- Admin Services ---- #
  def index
    @comments = Comment.all
    render json:@comments
  end

  def show
    render json:@comment
  end

  def destroy
    @comment.destroy
  end

  def publish
    @comment.published!
    render status: :ok
  end

  def reject
    @comment.rejected!
    render status: :ok
  end

  def pending
    @comment.pending!
    render status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end

end
