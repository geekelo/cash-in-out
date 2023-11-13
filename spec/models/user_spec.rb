# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = create(:user)
    expect(user).to be_valid
  end
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(Devise.password_length.min) }
  it { should validate_length_of(:password).is_at_most(Devise.password_length.max) }
  it { should have_many(:entities) }
  it { should have_many(:incomes).dependent(:destroy) }
  it { should have_many(:groups).dependent(:destroy) }
  it { should have_db_column(:email).of_type(:string).with_options(null: false, default: '') }
  it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
end
