require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'john@example.com', password: 'password', name: 'John Doe') }

  it 'should save user with valid attributes' do
    expect(user.valid?).to eq true
  end

  it 'should not save user without email' do
    user.email = nil
    is_expected.not_to be_valid
  end

  it 'should not save user without password' do
    user.password = nil
    is_expected.not_to be_valid
  end

  it 'should not save user without name' do
    user.name = nil
    is_expected.not_to be_valid
  end

  it 'should have a database column email of type string' do
    is_expected.to have_db_column(:email).of_type(:string)
  end

  it 'should have a database column encrypted_password of type string' do
    is_expected.to have_db_column(:encrypted_password).of_type(:string)
  end

  it 'should have a database column name of type string' do
    is_expected.to have_db_column(:name).of_type(:string)
  end

  it 'should have many entities' do
    is_expected.to have_many(:entities)
  end

  it 'should have many incomes' do
    is_expected.to have_many(:incomes).dependent(:destroy)
  end

  it 'should have many groups' do
    is_expected.to have_many(:groups).dependent(:destroy)
  end
end
