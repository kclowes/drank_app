require 'spec_helper'

feature 'user can see wines displayed' do
  scenario 'user can enter a wine and it will be saved in the database' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Wine'
    expect(page).to have_content('My Collections')
    click_on 'Add New Collection'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
    click_on 'Loved it'
    click_on 'Add Wine'
    fill_in 'wine[wine_type]', :with => 'Pinot Grigio'
    fill_in 'wine[wine_fruit_taste]', :with => 'peach'
    fill_in 'wine[wine_sweetness]', :with => '5'
    fill_in 'wine[wine_body]', :with => 'full'
    fill_in 'wine[wine_vintage]', :with => '2004'
    fill_in 'wine[wine_abv]', :with => '13%'
    fill_in 'wine[wine_overall_rating]', :with => '6'
    click_on 'Submit'
    expect(page).to have_content 'Pinot Grigio'
    expect(page).to have_content '2004'
    expect(page).to have_content '6'
  end

  scenario 'user can update a wine' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Wine'
    expect(page).to have_content('My Collections')
    click_on 'Add New Collection'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
    click_on 'Loved it'
    click_on 'Add Wine'
    fill_in 'wine[wine_type]', :with => 'Pinot Grigio'
    fill_in 'wine[wine_fruit_taste]', :with => 'peach'
    fill_in 'wine[wine_sweetness]', :with => '5'
    fill_in 'wine[wine_body]', :with => 'full'
    fill_in 'wine[wine_vintage]', :with => '2004'
    fill_in 'wine[wine_abv]', :with => '13%'
    fill_in 'wine[wine_overall_rating]', :with => '6'
    click_on 'Submit'
    click_on 'Edit this Pinot Grigio'
    fill_in 'wine[wine_type]', :with => 'Pinot Noir'
    click_on 'Submit'
    expect(page).to have_content('Pinot Noir')
  end

  scenario 'user can delete a wine' do
    visit '/'
    click_on 'Register'
    fill_in 'user[email]', :with => 'keri@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'register'
    expect(page).to have_content('Welcome keri@gmail.com')
    click_on 'Wine'
    expect(page).to have_content('My Collections')
    click_on 'Add New Collection'
    fill_in 'collection[collection_name]', :with => 'Loved it'
    click_on 'Add Collection'
    expect(page).to have_content('Loved it')
    click_on 'Loved it'
    click_on 'Add Wine'
    fill_in 'wine[wine_type]', :with => 'Pinot Grigio'
    fill_in 'wine[wine_fruit_taste]', :with => 'peach'
    fill_in 'wine[wine_sweetness]', :with => '5'
    fill_in 'wine[wine_body]', :with => 'full'
    fill_in 'wine[wine_vintage]', :with => '2004'
    fill_in 'wine[wine_abv]', :with => '13%'
    fill_in 'wine[wine_overall_rating]', :with => '6'
    click_on 'Submit'
    click_on 'Delete this Pinot Grigio'
    expect(page).to have_no_content('Pinot Grigio')
  end

end