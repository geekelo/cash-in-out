require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(email: 'john@example.com', password: 'password', name: 'John Doe') }
  let(:group) { Group.create(name: 'Sample Group') }
  let(:entity) { Entity.new(name: 'Sample Entity', amount: 100, user: user, group: group) }

  it 'should save entity with valid attributes' do
    expect(entity.valid?).to eq true
  end

  it 'should not save entity without name' do
    entity.name = nil
    is_expected.not_to be_valid
  end

  it 'should not save entity without amount' do
    entity.amount = nil
    is_expected.not_to be_valid
  end

  it 'should not save entity with negative amount' do
    entity.amount = -1
    expect(entity.valid?).to eq false
  end

  it 'should not save an entity if amount is not a number' do
    entity.amount = 'Invalid'
    is_expected.not_to be_valid
  end

  it 'should belong to a user' do
    is_expected.to belong_to(:user)
  end

  it 'should belong to a group' do
    is_expected.to belong_to(:group)
  end

  it 'should have a database column name of type string' do
    is_expected.to have_db_column(:name).of_type(:string)
  end

  it 'should have a database column amount of type decimal' do
    is_expected.to have_db_column(:amount).of_type(:decimal)
  end

  it 'should have a database column user_id of type integer' do
    is_expected.to have_db_column(:user_id).of_type(:integer)
  end

  it 'should have a database column group_id of type integer' do
    is_expected.to have_db_column(:group_id).of_type(:integer)
  end
end
