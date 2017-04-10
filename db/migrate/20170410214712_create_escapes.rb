class CreateEscapes < ActiveRecord::Migration[5.0]
  def change
    create_table :escapes do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :city
      t.string :image

      t.timestamps null: false
    end
  end
end
