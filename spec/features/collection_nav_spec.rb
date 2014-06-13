require 'spec_helper'

feature 'collections' do
  scenario 'user can make a new wine and it will show up on their collection page' do
    login_user

    new_collection

    click_link 'Loved it'
    click_link 'Delete Collection'
    expect(page).to_not have_content 'Loved it'
  end

  scenario 'wines can be displayed in their collection' do
    login_user

    new_collection

    create_wine

    expect(page).to have_content('Loved it')
    expect(page).to have_content('Pinot Grigio')
  end

  scenario 'user can edit the name of the collection' do

    login_user

    new_collection

    click_link 'Loved it'
    click_on 'Edit'
    fill_in 'collection[collection_name]', :with => 'It was okay'
    click_on 'Edit Collection'
    expect(page).to have_content('It was okay')
  end
end