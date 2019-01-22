class AddCategoryAddressToPurchaseOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :category, :string
    add_column :purchase_orders, :address, :string
  end
end
