class OrdersController < ApplicationController
  before_action :authenticate_user #what does that mean?

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    # calculated_subtotal = product.price * params[:quantity].to_i
    # calculated_tax = product.price * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,

    )
    if @order.save
      carted_products.update_all(status: "purchased", order_id: @order.id)
    else
      render :show
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
