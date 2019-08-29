class AddImageIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :image_id, :string, default: ''
  end
end
