class ArticleController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy, :comments, :create_comment, :publish, :pending]
  before_action :set_article_by_title, only: [:view]

  # ---- Blog Services ---- #
  def search
    @articles = Article.published.order(updated_at: :desc)
    render json:@articles, status: :ok
  end

  def view
    render json:@article, status: :ok
  end

  def comments
    @comments = @article.comments.published.order(created_at: :desc).take(2)
    render json:@comments
  end

  def create_comment
    render status: :created if @article.create_comment(comment_params)
  end

  # ---- Admin Services ---- #
  def show
    render json:@article, status: :ok
  end

  def create
    @article = Article.new
    @article.save
    render status: :created if @article.create_translation article_params[:fields]
  end

  def update
  end

  def destroy
    @article.destroy
  end

  def publish
    @article.published!
    render status: :ok
  end

  def pending
    @article.pending!
    render status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def set_article_by_title
    title = params[:title].gsub '_', ' '
    translation = ArticleTranslation.find_by_title(title)
    @article = translation.article if translation
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(fields: [:lang, :title, :content])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end
end
