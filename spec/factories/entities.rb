# spec/factories/entities.rb
require 'faker'

FactoryBot.define do
  factory :entity do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal }
    user
    association :group, factory: :group
  end
end
