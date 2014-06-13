require 'spec_helper'

describe Wine do
  it 'makes sure wines are being stored in the database' do
    Wine.create!(wine_type: 'Merlot', wine_vintage: 2014)
  end
end