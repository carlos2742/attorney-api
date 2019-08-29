class Tag < ApplicationRecord
  has_many :translations, foreign_key: 'tag_id', class_name: "TagTranslation", dependent: :delete_all
  has_and_belongs_to_many :articles, dependent: :delete_all

  def name
    translation.name
  end

  def translation
    translations.find_by_lang(I18n.locale)
  end

end
