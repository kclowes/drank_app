def new_collection
  click_link 'My Collections'
  click_link '+'
  fill_in 'collection[collection_name]', :with => 'Loved it'
  click_on 'Submit'
  expect(page).to have_content('Loved it')
end