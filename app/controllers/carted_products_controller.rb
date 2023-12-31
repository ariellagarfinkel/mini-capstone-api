class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    render :show
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def destroy
    if @carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
      @carted_product.update(status: "removed")
      render json: { message: "product successfully removed from cart wink" }
    else
      render json: { message: "Keep your hands off!!" }
    end
  end
end
