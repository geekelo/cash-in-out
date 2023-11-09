# spec/controllers/categories_controller_spec.rb

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User model and a factory for it

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @categories with current user\'s groups' do
      category = create(:group, user: user)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Group)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect {
          post :create, params: { group: { name: 'New Category', icon: 'fa-star' } }
        }.to change(Group, :count).by(1)
      end

      it 'redirects to categories index' do
        post :create, params: { group: { name: 'New Category', icon: 'fa-star' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new category' do
        expect {
          post :create, params: { group: { name: '', icon: '' } }
        }.not_to change(Group, :count)
      end

      it 're-renders the new template' do
        post :create, params: { group: { name: '', icon: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:category) { create(:group, user: user) }

    it 'renders the show template' do
      get :show, params: { id: category.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested category to @category' do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'GET #edit' do
    let(:category) { create(:group, user: user) }

    it 'renders the edit template' do
      get :edit, params: { id: category.id }
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested category to @category' do
      get :edit, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'PATCH #update' do
    let(:category) { create(:group, user: user) }

    context 'with valid attributes' do
      it 'updates the category' do
        patch :update, params: { id: category.id, group: { name: 'Updated Category' } }
        category.reload
        expect(category.name).to eq('Updated Category')
      end

      it 'redirects to the updated category' do
        patch :update, params: { id: category.id, group: { name: 'Updated Category' } }
        expect(response).to redirect_to(category)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the category' do
        patch :update, params: { id: category.id, group: { name: '' } }
        category.reload
        expect(category.name).not_to eq('')
      end

      it 're-renders the edit template' do
        patch :update, params: { id: category.id, group: { name: '' } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:category) { create(:group, user: user) }

    it 'destroys the category' do
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Group, :count).by(-1)
    end

    it 'redirects to categories index' do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
