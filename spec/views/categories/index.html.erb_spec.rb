# spec/features/categories_spec.rb

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:name) { 'Food' } # Choose one of the category names from your collection
  let(:icon) { '🍔' }

  before do
    login_as(user, scope: :user)
    visit categories_path
  end

  scenario 'User views categories page' do
    # Ensure the page has the correct content
    expect(page).to have_content('CATEGORIES')

    # Add more expectations based on your view content
    expect(page).to have_content('BALANCE:')
    expect(page).to have_content('EXPENDITURE:')
    expect(page).to have_content('CREDIT:')
    expect(page).to have_link('➕ Add Credit', href: new_income_path)

    # Ensure the 'Add New Category' link is present
    expect(page).to have_link('Add New Category', href: new_category_path)

    click_link 'Add New Category'
    select icon
    select name

    # Submit the form
    click_button 'Save Category'

    # Assuming a successful creation will redirect to a different page or display a success message
    expect(page).to have_content('Category created successfully')
  end
end
