FactoryGirl.define do
  factory :property_color, class: Property do
    name 'Цвет'
    value { Faker::Commerce.color }
    size ''
  end
  factory :property_country, class: Property do
    name 'Страна'
    value { Faker::Address.country }
    size ''
  end
  factory :property_width, class: Property do
    name 'Ширина'
    value { Faker::Number.number(2) }
    size '.см'
  end
  factory :property_height, class: Property do
    name 'Высота'
    value { Faker::Number.number(2) }
    size '.см'
  end
end