class CreateBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :brews do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.decimal :ABV
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
