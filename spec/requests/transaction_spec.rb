# spec/requests/transactions_spec.rb
require 'rails_helper'

RSpec.describe TransactionsController, type: :request do
  let(:user) { create(:user) } # Assuming you have a User factory
  let(:category) { create(:group, user: user) } # Assuming you have a Group factory

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get new_category_transaction_path(category)
      expect(response).to render_template(:new)
    end

    it 'assigns a new transaction to @transaction' do
      get new_category_transaction_path(category)
      expect(assigns(:transaction)).to be_a_new(Entity)
    end
  end

  describe 'GET #edit' do
    let(:transaction) { create(:entity, category: category, user: user) } # Assuming you have an Entity factory
  end
end
