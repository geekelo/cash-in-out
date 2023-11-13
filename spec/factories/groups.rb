# spec/factories/groups.rb

FactoryBot.define do
  factory :group do
    name { 'Sample Group' }
    icon { '🍔' } # Provide a non-blank value for the Icon attribute
    # other attributes as needed
  end
end
