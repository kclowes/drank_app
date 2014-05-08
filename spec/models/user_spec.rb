require 'spec_helper'

describe User do
  it 'validates uniqueness of email' do
    User.create!(:email => 'keri@example.com', :password => 'password')
    user = User.new(:email => 'keri@example.com')
    expect(user).to_not be_valid
  end

  it 'validates email presence' do
    user = User.new(:email => '', :password => 'password')
    expect(user).to_not be_valid
  end
end
