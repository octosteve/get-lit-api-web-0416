class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :description
      t.string :instructions
      t.string :source

      t.timestamps null: false
    end
  end
end
