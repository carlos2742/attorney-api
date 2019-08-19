class ArticleTranslation < ApplicationRecord
  belongs_to :article
  enum lang: [ :es, :en ]
end
