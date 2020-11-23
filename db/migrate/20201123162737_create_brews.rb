class CreateBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :brews do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :ABV
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
