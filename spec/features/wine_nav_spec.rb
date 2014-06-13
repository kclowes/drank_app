require 'spec_helper'

feature 'user can see wines displayed' do

  before do
    register_user
    new_collection
    create_wine
  end

  scenario 'user can enter a wine and it will be saved in the database' do
    expect(page).to have_content 'Pinot Grigio'
    expect(page).to have_content 'Fat bastard'
    expect(page).to have_content '2004'
    expect(page).to have_content '6'
    click_on 'My Wines'
    expect(page).to have_content 'Pinot Grigio'
  end

  scenario 'user can update a wine' do
    click_on 'Edit this Pinot Grigio'
    select 'Pinot Noir', :from => 'wine[wine_type]'
    click_on 'Submit'
    expect(page).to have_content('Pinot Noir')
  end

  scenario 'user can delete a wine' do
    click_on 'Delete this Pinot Grigio'
    expect(page).to have_no_content('Pinot Grigio')
  end

end