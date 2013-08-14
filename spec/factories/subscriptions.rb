# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    anniversary_date "2013-08-14"
    active false
    product_id 1
    customer_id 1
  end
end
