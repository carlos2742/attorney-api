class ArticleController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy, :comments, :create_comment, :publish, :pending]
  before_action :set_article_by_permalink, only: [:view]
  before_action :set_lang, only: [:search, :view]
  load_and_authorize_resource

  # ---- Blog Services ---- #
  def search
    @articles = Article.published.order(updated_at: :desc).paginate(page: page)
    total = @articles.count
    @articles = @articles.group_by { |m| m.updated_at.beginning_of_month }
    ags = ArticleGroupSerializer.new(@articles)
    ags.add_total(total)
    render json: ags.serializable_hash
  end

  def view
    render json:@article, status: :ok
  end

  def comments
    @comments = @article.comments.published.paginate(page: page)
    cls = CommentListSerializer.new(@comments)
    render json: cls.serializable_hash
  end

  def create_comment
    render json: {created: 'success'}, status: :created if @article.create_comment(comment_params)
  end

  # ---- Admin Services ---- #

  def upload_file
    metadata = params[:image]
    file_id = @drive_service.storage_file(metadata, ENTITY_TYPE::ARTICLE)
    if file_id
      render json:{drive_file_id: file_id}, status: :ok
    else
      render json:{message: 'error'}, status: :bad_request
    end
  end

  def index
    render json:Article.all.order(id: :desc), each_serializer: ArticleSummarySerializer, status: :ok
  end

  def show
    render json:@article, serializer: ArticleAdminSerializer, status: :ok
  end

  def create
    if article_params && tag_params && translation_params
      @article = Article.new(article_params)
      @article.save
      @article.tags << Tag.find(tag_params[:values])
      render json:{id: @article.id}, status: :created if @article.create_translation translation_params[:fields]
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end
  end

  def update
    if !article_params && !tag_params && !translation_params
      render json:{message: 'wrong params'}, status: :bad_request
      return
    end

    if article_params
      @article.practice_area_id = article_params[:practice_area_id] if @article.practice_area_id != article_params[:practice_area_id]
      @article.image_id = article_params[:image_id] if @article.image_id != article_params[:image_id]
      @article.save
    end

    if translation_params && !translation_params[:fields].empty?
      @article.update_translation translation_params[:fields]
    end

    if tag_params && !tag_params[:values].empty? && tag_params[:values] != @article.tags.pluck(:id)
      @article.tags.delete_all
      @article.tags << Tag.find(tag_params[:values])
    end
    render json:@article, serializer: ArticleAdminSerializer, status: :ok
  end

  def destroy
    @article.destroy
  end

  def publish
    @article.published!
    render json:{status: @article.status}, status: :ok
  end

  def unpublish
    @article.pending!
    render json:{status: @article.status}, status: :ok
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

  def tag_params
    params.require(:tag).permit(values: [])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end

  def filter_params
    params.require(:filters).permit(:practice_area_id, :content);
  end

  def page
    params[:page] ? params[:page] : 1
  end
end
