class Article < ApplicationRecord
  has_many :translations, foreign_key: 'article_id', class_name: "ArticleTranslation", dependent: :delete_all
  has_many :comments,->{ where(:reference_type=>'article')}, :foreign_key => :reference_id
  has_and_belongs_to_many :tags, dependent: :delete_all
  belongs_to :practice_area

  self.per_page = 8

  enum status: [ :pending, :published ]

  def title
    translation.title
  end

  def permalinks
    permalinks = {
        es: translations.find_by_lang(:es).permalink,
        en: translations.find_by_lang(:en).permalink
    }
    permalinks
  end

  def content
    translation.content
  end

  def translation
    translations.find_by_lang(I18n.locale)
  end

  def create_translation (fields)
    fields.each do |item|
      article_trans = ArticleTranslation.new
      article_trans.title = item[:title]
      article_trans.content = item[:content]
      article_trans.lang = item[:lang]
      translations << article_trans
    end
  end

  def create_comment (params)
    create_comment_template(params) do |comment|
      comment.reference_type = Comment.reference_types[:article]
    end
  end
end
