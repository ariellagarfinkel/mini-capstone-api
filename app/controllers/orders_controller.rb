class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = product.price * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,

    )
    if @order.save
      render json: { message: "Order accepted" }
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    if @order
      render :show
    else
      render json: { message: "Not your orders" }
    end
  end

  def index
    if current_user
      @orders = current_user.orders
      render :index
    else
      render json: { message: "Please log in to see your orders" }, status: :unauthorized
    end
  end
end
