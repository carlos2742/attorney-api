class ArticleTranslation < ApplicationRecord
  belongs_to :article
  enum lang: [ :es, :en ]

  before_save do
    self.permalink = self.title
    self.permalink = self.permalink.gsub!(/[?¡!@%&"]/,'').downcase.tr(" ", "-")
  end

end
