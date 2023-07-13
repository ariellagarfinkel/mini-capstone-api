class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers
  end

  def show
    supplier = Supplier.find_by(id: params["id"])
    render json: supplier
  end

  def create
    supplier = Supplier.create(name: "lulu lemon", email: "lll@gmail.com", phone_number: 12345678)
    render json: supplier
  end

  def update
    supplier = Supplier.find_by(id: params["id"])
    supplier.name = params["name"] || supplier.name,
                    supplier.email = params["email"] || supplier.email,
    supplier.phone_number = params["phone_number"] || supplier.phone_number
    render json: supplier
  end
end
