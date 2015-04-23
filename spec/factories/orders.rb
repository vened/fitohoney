FactoryGirl.define do
  factory :order, class: Order do
    session_id {Faker::Number.hexadecimal(20)} 
  end
end