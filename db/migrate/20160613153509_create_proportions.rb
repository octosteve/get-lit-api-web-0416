class CreateProportions < ActiveRecord::Migration
  def change
    create_table :proportions do |t|
      t.belongs_to :cocktail, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true
      t.string :amount

      t.timestamps null: false
    end
  end
end
