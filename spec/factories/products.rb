FactoryGirl.define do
  factory :product, class: Product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
  end  
  factory :product_price_float, class: Product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price 28.23
  end  
  factory :product_price, class: Product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price 6563
  end  
end