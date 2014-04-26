require './spec/spec_helper'

feature 'user can see wines displayed' do
  scenario 'user can enter a wine and it will be saved in the database' do
    visit '/'
    expect(page).to have_content('Welcome!')
    click_on 'Wine Drank'
    expect(page).to have_content('Wines')
    expect(page).to have_content('Top Wines')
    expect(page).to have_content('Maybe Again')
    expect(page).to have_content('Never Again')
    click_on 'Add Wine'
    fill_in 'wine[wine_type]', :with => 'Pinot Grigio'
    fill_in 'wine[wine_fruit_taste]', :with => 'peach'
    fill_in 'wine[wine_sweetness]', :with => '5'
    fill_in 'wine[wine_body]', :with => 'full'
    fill_in 'wine[wine_vintage]', :with => '2004'
    fill_in 'wine[wine_abv]', :with => '13%'
    fill_in 'wine[wine_overall_rating]', :with => '6'
    click_on 'Submit'
    expect(page).to have_content 'peach 5 full 2004 13% 6'
  end

  scenario 'user can update a wine' do
    visit '/'
    click_on 'Wine Drank'
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
    click_on 'Wine Drank'
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