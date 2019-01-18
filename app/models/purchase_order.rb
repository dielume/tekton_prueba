class PurchaseOrder < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :description, :reception_date, :shipping_date, presence: true
  validates :photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

  STATUS_VALUES = ["Espera", "Enviado", "Entregado"]
end
