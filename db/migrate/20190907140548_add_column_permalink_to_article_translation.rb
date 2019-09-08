class AddColumnPermalinkToArticleTranslation < ActiveRecord::Migration[5.0]
  def change
    add_column :article_translations, :permalink, :string
  end
end
