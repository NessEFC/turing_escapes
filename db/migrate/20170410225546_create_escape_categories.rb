class CreateEscapeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :escape_categories do |t|
      t.references :escape, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
