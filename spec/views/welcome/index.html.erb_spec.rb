# spec/features/home_spec.rb
require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User sees the splash logo and registration buttons' do
    # Visit the home page
    visit welcome_index_path

    # Check if the splash logo is displayed
    expect(page).to have_css('img#splashlogo.custom-class')

    # Check if the "Sign up" and "Login" buttons are present
    expect(page).to have_link('Sign up', href: new_user_registration_path, class: 'regbtns')
    expect(page).to have_link('Login', href: new_user_session_path, class: 'regbtns')
  end
end
