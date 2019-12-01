class Tag < ApplicationRecord
  has_many :translations, foreign_key: 'tag_id', class_name: "TagTranslation", dependent: :destroy
  has_and_belongs_to_many :articles, dependent: :delete_all

  def name
    translation.name
  end

  def translation
    translations.find_by_lang(I18n.locale)
  end

  def create_translation (fields)
    fields.each do |item|
      trans = TagTranslation.new
      trans.name = item[:name]
      trans.lang = item[:lang]
      translations << trans
    end
  end

  def update_translation (fields)
    fields.each do |item|
      trans = translations.find_by_lang(item[:lang])
      trans.name = item[:name] if trans.name != item[:name]
      trans.save
    end
  end

end
