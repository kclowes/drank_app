require 'spec_helper'

feature 'Login/logout/register' do

  scenario 'user can register' do
    register_user

    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Logout'
    visit '/'
    within('header') { click_on 'Register' }
    fill_in 'user[email]', :with => 'kristi@gmail.com'
    fill_in 'user[password]', :with => 'password1'
    within('body') { click_on 'register' }
    expect(page).to have_content('Welcome kristi@gmail.com')
    expect(page).to_not have_content('Welcome keri@gmail.com')
  end

  scenario 'user can login' do
    register_user

    click_on 'Logout'

    login_user


    expect(page).to have_content('You should like the wine you drank.')
  end

  scenario 'user can logout' do
    register_user

    click_on 'Logout'

    within('header') do
      expect(page).to_not have_content('keri@gmail.com')
    end
  end

  scenario 'user cannot register with a blank email and a blank password' do
    visit '/'
    within('header') { click_on 'Register' }
    fill_in 'user[email]', :with => ''
    fill_in 'user[password]', :with => ''
    within('body') { click_on 'register' }
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user cannot register with a blank email' do
    visit '/'
    within('header') { click_on 'Register' }
    fill_in 'user[email]', :with => ''
    fill_in 'user[password]', :with => 'abcde'
    within('body') { click_on 'register' }
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'user cannot register with a blank password' do
    visit '/'
    within('header') { click_on 'Register' }
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => ''
    within('body') { click_on 'register' }
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user cannot login with a blank email or password' do
    visit '/'
    within('header') { click_on 'Login' }
    fill_in 'email', :with => ''
    fill_in 'password', :with => ''
    within('body') { click_on 'login' }
    expect(page).to have_content("Email/password combination invalid")
  end

  scenario 'user can see an about page' do
    visit '/'
    within('header') { click_on 'Register' }
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    within('body') { click_on 'register' }
    click_on 'Wine 101'
    expect(page).to have_content 'You should like the wine you drank.'
  end

  scenario 'user gets sent an email to reset their password' do
    register_user
    click_on 'Logout'
    visit root_path
    within('header') { click_on 'Login' }
    click_on 'Forgot your password?'
    fill_in 'email', with: 'keri@example.com'
    click_on 'Reset Password'
    expect(page).to have_content('An email has been sent with instructions')
  end
end
