class ProductsController < ApplicationController
  def first_product
    @product = Product.first
    render template: "products/show"
  end

  def all_products
    @product = Product.all_products
    render template: "product/index"
  end
end
