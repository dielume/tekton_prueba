class PurchaseOrder < ApplicationRecord
  belongs_to :user
  validates :description, :reception_date, :shipping_date, presence: true

  STATUS_VALUES = ["Espera", "Enviado", "Entregado"]
end
