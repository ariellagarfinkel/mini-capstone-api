class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :name, presence: true
  #validates :price, :quantity, :description, :name, presence: true

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.

  # end
  def is_discounted
    price <= 10
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end
end
