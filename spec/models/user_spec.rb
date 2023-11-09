require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @user = User.create(first_name: 'Elizabeth', last_name: 'Bennet', email: 'lizzy@bennet.com', password: 'darcyluver', password_confirmation: 'darcyluver')
    end

    it "must be created with a password and password_confirmation fields" do
      @user.password = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid when password and password_confirmation fields do not match" do
      @user.password_confirmation = 'darcylover'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid when first name is not filled" do
      @user.first_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid when last name is not filled" do
      @user.last_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid when email is not filled" do
      @user.email  = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid when email is not unique" do
      user2 = User.create(first_name: 'Elizabeth', last_name: 'Bennet', email: 'LIZZY@bennet.com', password: 'darcyluver', password_confirmation: 'darcyluver')
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

    it "is not valid when password is less than 8 characters" do
      @user.password = 'darcy'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
     end

  end
end