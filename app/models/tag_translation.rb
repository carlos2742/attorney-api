class TagTranslation < ApplicationRecord
  belongs_to :tag
  enum lang: [ :es, :en ]
end
