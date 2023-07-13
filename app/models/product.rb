class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  # validates :quantity, presence: true
  #validates :description, presence: true
  #validates :image_url, presence: true
  #validates :name, presence: true
  #validates :price, :quantity, :description, :image_url, :name, presence: true

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
