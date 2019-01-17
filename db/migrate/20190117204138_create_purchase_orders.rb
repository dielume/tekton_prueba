class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.string :description
      t.string :photo
      t.references :user, foreign_key: true
      t.string :status
      t.datetime :shipping_date
      t.datetime :reception_date

      t.timestamps
    end
  end
end
