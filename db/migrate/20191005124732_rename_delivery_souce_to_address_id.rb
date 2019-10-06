class RenameDeliverySouceToAddressId < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery_souce, :integer
    rename_column :products, :delivery_souce , :address_id 
  end
end
