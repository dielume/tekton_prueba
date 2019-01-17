class ChangePurchaseOrderDescription < ActiveRecord::Migration[5.2]
  def change
    change_column :purchase_orders, :description, :text
  end
end
