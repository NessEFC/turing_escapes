class CreateOrderEscapes < ActiveRecord::Migration[5.0]
  def change
    create_table :order_escapes do |t|
      t.references :order, index: true, foreign_key: true
      t.references :escape, index: true, foreign_key: true
      t.integer :quantity
      t.float :total

      t.timestamps null: false
    end
  end
end
