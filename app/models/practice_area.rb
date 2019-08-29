class PracticeArea < ApplicationRecord
  has_many :articles
  has_many :translations, foreign_key: 'practice_area_id', class_name: "PracticeAreaTranslation", dependent: :delete_all

  def name
    translation.name
  end

  def translation
    translations.find_by_lang(I18n.locale)
  end

end
