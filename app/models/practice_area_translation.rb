class PracticeAreaTranslation < ApplicationRecord
  belongs_to :practice_area
  enum lang: [ :es, :en ]
end
