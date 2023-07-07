class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.create(name: "pen", price: 1, image_url: "https://media.gcflearnfree.org/content/55e0730c7dd48174331f5164_01_17_2014/whatisacomputer_desktop_computers.jpg", description: "a utensil that writes with ink")
    render :show
  end

  def create
    @product = Product.create(name: params["name"], price: params["price"], image_url: params["image_url"], description: params["description"])
    render :show
  end
end

#render :show
#render :index
