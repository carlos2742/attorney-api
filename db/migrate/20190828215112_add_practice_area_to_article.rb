class AddPracticeAreaToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :practice_area
  end
end
