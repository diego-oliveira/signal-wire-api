FactoryBot.define do
  factory :tag do
    name { Faker::Alphanumeric.alpha(number: 10) }
  end
end
