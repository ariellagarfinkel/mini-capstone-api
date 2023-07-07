Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "all_products"
  get "/product/:id" => "products#one_product"
end
