class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :content
      t.integer :status
      t.integer :reference_type
      t.integer :reference_id
      t.timestamps
    end
  end
end
