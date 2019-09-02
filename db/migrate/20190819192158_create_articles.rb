class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.timestamps
      t.integer :status, default: 0
      t.string :image_id, default: ''
      t.references :practice_area
    end
  end
end
