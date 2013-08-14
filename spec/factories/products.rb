# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    allotment 1
    price 1
    period "MyString"
  end
end
