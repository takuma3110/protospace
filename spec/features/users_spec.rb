require 'rails_helper'

RSpec.feature 'user', type: :feature do

  given(:user) { build(:user) }
  given(:login_user) { create(:user) }

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

  it 'signs in ', js: true do
    visit root_path
    click_on 'Get Started'
    fill_in 'user_email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_button 'Sign in'
    expect(page).to have_selector '.alert-notice', text: 'Signed in successfully.'
  end
end
