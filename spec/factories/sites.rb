# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    url "MyString"
    user_id 1
    submitted false
    processing false
    success false
    failed false
    aasm_state "MyString"
  end
end
