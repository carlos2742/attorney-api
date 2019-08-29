class AddKeyToPracticeAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :practice_areas, :key, :string
  end
end
