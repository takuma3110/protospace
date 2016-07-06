require 'rails_helper'

RSpec.feature 'user', type: :feature do

  given(:user) { build(:user) }

  it 'creates new user', js: true do
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_member', with: user.member
    fill_in 'user_profile', with: user.profile
    fill_in 'user_works', with: user.works
    click_button 'SAVE'
    expect(page).to have_selector '.alert-notice', text: 'Welcome! You have signed up successfully.'
  end
end
