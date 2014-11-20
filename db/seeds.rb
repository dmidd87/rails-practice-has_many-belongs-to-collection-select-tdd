Cat.destroy_all
Toy.destroy_all

10.times do
  cat = Cat.create!(name: Faker::Name.first_name)
  rand(6).times do
    Toy.create!(
      cat_id: cat.id,
      name: Faker::Commerce.product_name
    )
  end
end
