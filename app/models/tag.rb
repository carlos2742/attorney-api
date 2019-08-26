class Tag < ApplicationRecord
  has_many :translations, foreign_key: 'tag_id', class_name: "TagTranslation"
  has_and_belongs_to_many :articles

  def name
    translation.name
  end

  def translation (lang)
    translations.find_by_lang(lang)
  end

end
