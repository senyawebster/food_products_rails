

Review.destroy_all
Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Commerce.product_name,
                  cost: Faker::Commerce.price,
                  country_of_origin: Faker::Address.country)
end

250.times do |index|
  Review.create!(author: Faker::GameOfThrones.character,
                content_body: Faker::Lorem.characters(51),
                rating: Faker::Number.between(1, 5),
                product_id: Faker::Number.between(Product.first.id, Product.last.id))
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
