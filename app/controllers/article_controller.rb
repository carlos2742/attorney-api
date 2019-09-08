class ArticleController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy, :comments, :create_comment, :publish, :pending]
  before_action :set_article_by_permalink, only: [:view]
  before_action :set_lang, only: [:search, :view]

  # ---- Blog Services ---- #
  def search
    @articles = Article.published.order(updated_at: :desc).group_by { |m| m.updated_at.beginning_of_month }
    ags = ArticleGroupSerializer.new(@articles)
    render json: ags.serializable_hash
  end

  def view
    render json:@article, status: :ok
  end

  def comments
    @comments = @article.comments.published.take(3)
    render json:@comments
  end

  def create_comment
    render json: {created: 'success'}, status: :created if @article.create_comment(comment_params)
  end

  # ---- Admin Services ---- #
  def show
    render json:@article, status: :ok
  end

  def create
    @article = Article.new(article_params)
    @article.save
    render status: :created if @article.create_translation translation_params[:fields]
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

  def set_article_by_permalink
    permalink = params[:permalink]
    translation = ArticleTranslation.find_by_permalink(permalink)
    @article = translation.article if translation
  end

  def set_lang
    lang = params[:lang]
    I18n.locale = lang
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:practice_area_id, :image_id)
  end

  def translation_params
    params.require(:translation).permit(fields: [:lang, :title, :content])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end
end
