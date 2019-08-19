class Article < ApplicationRecord
  has_many :article_translations
  has_many :comments,->{ where(:reference_type=>'article')}, :foreign_key => :reference_id

  def translation (lang)
    article_translations.where(lang: lang)
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
