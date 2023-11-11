# ./spec/factories/incomes.rb

FactoryBot.define do
  factory :income do
    amount { 100 } # You can change the amount as needed
    user
  end
end
