class CreateArticleTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :article_translations do |t|
      t.references :article, foreign_key: true
      t.integer :lang
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
