require 'spec_helper'

feature 'collections' do
  scenario 'user can make a new wine and it will show up on their collection page' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_link 'Wine'
    expect(page).to have_content('My Collections')
    click_link 'Add New Collection'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
  end
end