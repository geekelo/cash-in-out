# spec/requests/incomes_spec.rb

require 'rails_helper'

RSpec.describe IncomesController, type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get new_income_path
      expect(response).to render_template(:new)
    end

    it 'assigns a new income to @income' do
      get new_income_path
      expect(assigns(:income)).to be_a_new(Income)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new income' do
        expect do
          post incomes_path, params: { income: { amount: 100 } }
        end.to change(Income, :count).by(1)
      end

      it 'redirects to categories index' do
        post incomes_path, params: { income: { amount: 100 } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid attributes' do

    end
  end

  describe 'POST #clear_all' do
    it 'destroys all incomes' do
      create(:income, user: user)
      create(:income, user: user)
      expect do
        post clear_all_incomes_path
      end.to change(Income, :count).by(-2)
    end

    it 'redirects to categories index' do
      post clear_all_incomes_path
      expect(response).to redirect_to(categories_path)
    end
  end
end
