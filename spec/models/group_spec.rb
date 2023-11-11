# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:group) { Group.new(name: 'Sample Group', icon: 'sample_icon', user: user) }

  it 'should save group with valid attributes' do
    expect(group.valid?).to eq true
  end

  it 'should not save group without name' do
    group.name = nil
    is_expected.not_to be_valid
  end

  it 'should not save group without icon' do
    group.icon = nil
    is_expected.not_to be_valid
  end

  it 'should belong to a user' do
    is_expected.to belong_to(:user)
  end

  it 'should have many entities' do
    is_expected.to have_many(:entities).dependent(:destroy)
  end

  it 'should have a database column name of type string' do
    is_expected.to have_db_column(:name).of_type(:string)
  end

  it 'should have a database column icon of type string' do
    is_expected.to have_db_column(:icon).of_type(:string)
  end
end
