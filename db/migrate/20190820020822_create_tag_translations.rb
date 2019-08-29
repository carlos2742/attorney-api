class CreateTagTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_translations do |t|
      t.references :tag, foreign_key: true
      t.string :name
      t.integer :lang
      t.timestamps
    end
  end
end
