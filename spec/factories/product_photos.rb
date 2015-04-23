FactoryGirl.define do
  factory :product_photo, class: ProductPhoto do
    photo { Faker::Avatar.image(slug = nil, size = '1000x1000', format = 'jpg') }
  end  
end