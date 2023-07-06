Rails.application.routes.draw do
  get "/product", controller: "products", action: "product"
end
