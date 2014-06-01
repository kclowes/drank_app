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
    click_link '+'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
    click_link 'Loved it'
    click_link 'Delete Collection'
    expect(page).to_not have_content 'Loved it'
  end

  scenario 'wines can be displayed in their collection' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_link 'Wine'
    expect(page).to have_content('My Collections')
    click_link '+'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
    click_link 'Loved it'
    click_on '+'
    fill_in 'wine[wine_type]', :with => 'Pinot Grigio'
    fill_in 'wine[wine_fruit_taste]', :with => 'peach'
    fill_in 'wine[wine_sweetness]', :with => '5'
    fill_in 'wine[wine_body]', :with => 'full'
    fill_in 'wine[wine_vintage]', :with => '2004'
    fill_in 'wine[wine_abv]', :with => '13%'
    fill_in 'wine[wine_overall_rating]', :with => '6'
    click_on 'Submit'
    expect(page).to have_content('Loved it')
    expect(page).to have_content('Pinot Grigio')
  end
end