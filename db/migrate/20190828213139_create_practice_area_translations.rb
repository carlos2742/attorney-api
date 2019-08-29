class CreatePracticeAreaTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :practice_area_translations do |t|
      t.references :practice_area, foreign_key: true
      t.string :name
      t.integer :lang
      t.timestamps
    end
  end
end
