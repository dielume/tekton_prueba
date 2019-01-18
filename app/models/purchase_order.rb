class PurchaseOrder < ApplicationRecord
  belongs_to :user

  STATUS_VALUES = ["Espera", "Enviado", "Entregado"]
end
