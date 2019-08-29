class CreatePracticeAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :practice_areas do |t|
      t.timestamps
    end
  end
end
