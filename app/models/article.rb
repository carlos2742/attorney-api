class Article < ApplicationRecord
  has_many :translations, foreign_key: 'article_id', class_name: "ArticleTranslation"
  has_many :comments,->{ where(:reference_type=>'article')}, :foreign_key => :reference_id
  has_and_belongs_to_many :tags

  enum status: [ :pending, :published ]

  def title
    translation.title
  end

  def content
    translation.content
  end

  def translation
    translations.find_by_lang(I18n.locale)
  end

  def create_translation (lang)
    article_trans = ArticleTranslation.new
    article_trans.title = lang === 'en' ? 'Hello World' : 'Hola Mundo'
    article_trans.content = lang === 'en' ? 'Testing Article multilanguage' : 'Probando Articulo con multilenguaje'
    article_trans.lang = lang
    article_translations << article_trans
  end

  def create_comment (params)
    create_comment_template(params) do |comment|
      comment.reference_type = Comment.reference_types[:article]
    end
  end
end
