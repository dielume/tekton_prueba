class PurchaseOrder < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :description, :reception_date, :shipping_date,
            :status, :address, :category, presence: true
  validates :photo, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  before_create :set_default_propierties


  STATUS_VALUES = ["Espera", "Enviado", "Entregado", "Rechazado", "Cancelado"]
  CATEGORY_VALUES = ["Telefonía", "Informática", "Electrónica", "Joyería", "Calzado"]


  private

  def set_default_propierties
    self.user = user
    self.status = "Espera"
  end

end
