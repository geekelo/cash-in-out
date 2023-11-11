# spec/factories/entities.rb
FactoryBot.define do
  factory :entity do
    name { 'Example Transaction' }
    amount { 100.0 }
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    category { nil }
    user
    group
  end
end
