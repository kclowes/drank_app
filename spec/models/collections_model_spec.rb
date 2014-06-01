require 'spec_helper'

#create a test to make sure this is saving into the Collections database
describe Collection do
  it 'will create a new collection' do
    user = User.create!(email: 'keri@example.com', password: 'password')
    wine = Wine.create!(wine_type: 'Merlot')
    Collection.create!(user_id: user.id, wine_id: wine.id, collection_name: 'Loved it!')
  end
end