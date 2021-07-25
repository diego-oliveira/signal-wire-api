FactoryBot.define do
  factory :ticket do
    user_id { Faker::Number.number(digits: 3) }
    title { Faker::String.random }
  end
end
