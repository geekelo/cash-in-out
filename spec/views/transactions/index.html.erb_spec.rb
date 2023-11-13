# spec/features/complete_flow_spec.rb

require 'rails_helper'

RSpec.feature 'Complete Flow', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group, user: user) }
  let(:name) { 'Food' } # Choose one of the category names from your collection
  let(:icon) { '🍔' }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User completes the flow' do
    # Step 1: Visit categories page
    visit categories_path

    # Ensure the page has the correct content
    expect(page).to have_content('CATEGORIES')

    # Step 2: Create category
    click_link 'Add New Category'
    select icon
    select name
    click_button 'Save Category'

    # Assuming a successful creation will redirect to a different page or display a success message
    expect(page).to have_content('Category created successfully')

    # Step 3: Return to categories page
    visit categories_path

    # Ensure the created category is present
    expect(page).to have_link('Food')
    expect(page).to have_link('View')

    # Step 4: Click on the created category(view)
    click_link 'Food'

    # Ensure the page has the correct content for the specific category
    expect(page).to have_content('Total')
    expect(page).to have_content('ADD TRANSACTIONS')

    # Step 5: Click add transactions
    click_link 'Add Transaction'

    # Step 6: Create transactions
    fill_in 'Transaction', with: 'Grocery Shopping'
    fill_in 'Amount', with: 50.0
    click_button 'Add Transaction'

    # Assuming a successful creation will redirect to a different page or display a success message
    expect(page).to have_content('Transaction added successfully')
    expect(page).to have_content('Grocery Shopping')
    expect(page).to have_content('Edit')
    expect(page).to have_content('Delete')
  end
end
