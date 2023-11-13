require 'rails_helper'

RSpec.describe 'Edit Transaction', type: :system do
  describe 'edit page' do
    it 'shows the right content' do
      visit edit_category_transaction_path(1, 1)
      expect(page).to have_content('You need to sign in')
    end
  end
end
