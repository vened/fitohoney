FactoryGirl.define do
  factory :category, class: Category do
    title { Faker::Commerce.department }
  end
end