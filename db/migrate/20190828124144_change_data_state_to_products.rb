class ChangeDataStateToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :state, :string
  end
end
