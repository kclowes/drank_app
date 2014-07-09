require 'spec_helper'

describe Wine do
  it 'makes sure wines are being stored in the database' do
    wine = Wine.create!(wine_type: 'Merlot', wine_vintage: 2014)
    expect(wine).to be_valid
  end
end