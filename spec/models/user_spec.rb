require 'spec_helper'

describe User do
  before do
    @user = User.create!(email: "user@example.com", password: "something", password_confirmation: "something")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to (:password_confirmation) }
  it { should be_valid }
end


describe 'Password cannot be blank' do
  before do
    @user = User.new(email: "user@example.com", password: '  ', password_confirmation: '  ')
  end

  subject { @user }
  it { should_not be_valid }

  describe 'password should match password confirmation'
  before { @user.password_confirmation = 'mismatch' }
  it { should_not be_valid }
end

describe 'user Authentication' do
  before do
    @user = User.new(email: "bob@example.com", password: 'BobRocks', password_confirmation: 'BobRocks')
  end
  subject { @user }
  it { should respond_to(:authenticate) }

  describe 'return value of authenticate method' do
    before { @user.save }
    let (:found_user) { User.find_by(:email => @user.email) }
    describe 'with valid password' do
      it { should eq found_user.authenticate(@user.password) }
    end
    describe 'with invalid password' do
      let (:invalid_user) { found_user.authenticate('invalid') }
      it { should_not eq invalid_user }
      specify { expect(invalid_user).to be_false }
    end
  end
end