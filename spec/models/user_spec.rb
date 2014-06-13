require 'spec_helper'

describe User do
  describe 'Validations' do

    it 'will validate a user' do
      user = create_user
      expect(user).to be_valid
    end

    it 'will not allow the user to have a blank password' do
      user = User.create(email: 'keri@gmail.com', password: '', password_confirmation: '')
      expect(user).to_not be_valid
    end
  end
end


describe 'User authentication' do

  before do
    @user = create_user(email: "bob@example.com", password: 'BobRocks', password_confirmation: 'BobRocks')
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