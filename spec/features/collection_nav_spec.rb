require 'spec_helper'

feature 'collections' do

  before do
    register_user
    new_collection
  end

  scenario 'user can make a new wine and it will show up on their collection page' do
    click_link 'Loved it'
    click_link 'Delete Collection'
    expect(page).to_not have_content 'Loved it'
  end

  scenario 'wines can be displayed in their collection' do

    create_wine

    expect(page).to have_content('Loved it')
    expect(page).to have_content('Pinot Grigio')
  end

  scenario 'user can edit the name of the collection' do
    click_link 'Loved it'
    click_on 'Edit'
    fill_in 'collection[collection_name]', :with => 'It was okay'
    click_on 'Edit Collection'
    expect(page).to have_content('It was okay')
  end

  scenario 'user cannot leave the collection name blank' do
    click_on 'My Collections'
    click_on '+'
    fill_in 'collection[collection_name]', :with => ''
    click_on 'Add Collection'
    expect(page).to have_content('Please enter a collection name')
  end
end