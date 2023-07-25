class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true #allows me to create a carted product without an order_id
  belongs_to :product
  belongs_to :user
end
