class ArticleTranslation < ApplicationRecord
  belongs_to :article
  enum lang: [ :es, :en ]

  before_save do
    self.title = self.title.strip()
    self.permalink = self.title
    self.permalink = self.permalink.gsub!(/[.¿?¡!@%&"]/,'').strip().downcase.tr(" ", "-")
  end

end
