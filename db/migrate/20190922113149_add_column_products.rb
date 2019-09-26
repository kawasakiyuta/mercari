class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :child_category,:integer
    
    add_column :products, :grandchild_category,:integer
  end
end
