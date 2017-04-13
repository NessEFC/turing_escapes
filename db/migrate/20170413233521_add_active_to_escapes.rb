class AddActiveToEscapes < ActiveRecord::Migration[5.0]
  def change
    add_column :escapes, :active, :boolean, default: true 
  end
end
