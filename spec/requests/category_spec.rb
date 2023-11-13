# spec/requests/category_spec.rb

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { FactoryBot.create(:user) } # Assuming you have a User model and a factory for it

  before do
    sign_in user
  end

  describe 'GET /categories' do
    it 'renders the index template' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'assigns @categories with current user\'s groups' do
      category = create(:group, user: user)
      get categories_path
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET /categories/new' do
    it 'renders the new template' do
      get new_category_path
      expect(response).to render_template(:new)
    end

    it 'assigns a new category to @category' do
      get new_category_path
      expect(assigns(:category)).to be_a_new(Group)
    end
  end

  describe 'POST /categories' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect do
          post categories_path, params: { group: { name: 'New Category', icon: 'fa-star' } }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to categories index' do
        post categories_path, params: { group: { name: 'New Category', icon: 'fa-star' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new category' do
        expect do
          post categories_path, params: { group: { name: '', icon: '' } }
        end.not_to change(Group, :count)
      end

      it 're-renders the new template' do
        post categories_path, params: { group: { name: '', icon: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  # Add similar blocks for other actions (show, edit, update, destroy)
end
