class PracticeArea < ApplicationRecord
  has_many :translations, foreign_key: 'practice_area_id', class_name: "PracticeAreaTranslation", dependent: :delete_all

end
