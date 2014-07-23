require 'spec_helper'

feature 'reset password' do

  scenario 'user gets sent an email to reset their password' do
    register_user
    click_on 'Logout'
    visit root_path
    within('header') { click_on 'Login' }
    click_on 'Forgot your password?'
    fill_in 'email', with: 'keri@gmail.com'
    click_on 'Reset Password'
    expect(page).to have_content('An email has been sent with instructions')
  end

  scenario 'reset password' do
    user = create_user(token: SecureRandom.uuid)
    visit "/token/#{user.token}"
    expect(page).to have_content('Change Your Password')
    fill_in 'user[password]', with: 'Awesomeness'
    click_on 'Update User'
    expect(page).to have_content('Your password has been updated')
  end

end
