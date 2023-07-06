Rails.application.routes.draw do
  get "/product", controller: "products", action: "first_product"
end
