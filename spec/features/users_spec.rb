require 'rails_helper'

RSpec.feature 'user', type: :feature do

  given(:user) { build(:user) }
  given(:login_user) { create(:user) }
  given(:prototype) { build(:prototype, :with_sub_images) }


  it 'creates new user', js: true do
    visit root_path
    page.save_screenshot 'sample.png'
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

  it 'creates a new prototype', js: true do
    visit root_path
    click_on 'Get Started'
    fill_in 'user_email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_button 'Sign in'
    click_on 'New Proto'
    fill_in 'prototype_title', with: prototype.title
    fill_in 'prototype_catch_copy', with: prototype.catch_copy
    fill_in 'prototype_concept', with: prototype.concept
    attach_file 'prototype[thumbnails_attributes][0][image]', File.join(Rails.root, '/spec/fixtures/img/sample.png'),  visible: false
    1.upto(3) do |i|
      attach_file "prototype[thumbnails_attributes][#{i}][image]", File.join(Rails.root, '/spec/fixtures/img/sample.png'), visible: false
    end
    click_on '投稿する'
    expect(page).to have_selector '.alert-success', text: 'success'
  end
end
