require 'spec_helper'

feature 'Login/logout/register' do
  scenario 'user can register' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Logout'
    click_on 'Register'
    fill_in 'user[email]', :with => 'kristi@gmail.com'
    fill_in 'user[password]', :with => 'password1'
    click_on 'register'
    expect(page).to have_content('Welcome kristi@gmail.com')
    expect(page).to_not have_content('Welcome keri@gmail.com')
  end

  scenario 'user can login' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    click_on 'Logout'
    click_on 'Login'
    fill_in 'session[email]', :with => 'keri@gmail.com'
    fill_in 'session[password]', :with => 'password'
    click_on 'login'
    expect(page).to have_content('Welcome keri@gmail.com')
  end

  scenario 'user can logout' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Logout'
    expect(page).to_not have_content('keri@gmail.com')
  end
end
