class CreateAuthors < ActiveRecord::Migration
  def change
	create_table :authors do |a|
		a.string :name
		a.text :bio
		a.string :password_digest
		a.timestamps null: false
	end
  end
end