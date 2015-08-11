class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.integer :author_id
      t.text :text
      t.timestamps null: false
    end
  end
end