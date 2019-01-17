json.extract! purchase_order, :id, :description, :photo, :user_id, :status, :shipping_date, :reception_date, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
