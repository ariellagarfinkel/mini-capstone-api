product = Product.create!(name: "computer", price: 500, description: "A device that computes")

product = Product.create!(name: "waterbottle", price: 2, description: "something to drink")

supplier = Supplier.create!(name: "Nike", email: "nike@gmail.com", phone_number: "12345")
supplier = Supplier.create!(name: "adidas", email: "adidas@gmail.com", phone_number: "123456")
supplier = Supplier.create!(name: "under_armour", email: "underarmour@gmail.com", phone_number: "1234567")

Image.create!(url: "https://t4.ftcdn.net/jpg/01/36/70/67/360_F_136706734_KWhNBhLvY5XTlZVocpxFQK1FfKNOYbMj.jpg", product_id: Product.first.id)

Image.create!(url: "https://t4.ftcdn.net/jpg/01/36/70/67/360_F_136706734_KWhNBhLvY5XTlZVocpxFQK1FfKNOYbMj.jpg", product_id: Product.first.id)
