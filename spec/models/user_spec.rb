require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @user = User.create(first_name: 'Elizabeth', last_name: 'Bennet', email: 'lizzy@bennet.com', password: 'darcyluver', password_confirmation: 'darcyluver')
    end

    it "must be created with a password and password_confirmation fields" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "is not valid when password and password_confirmation fields do not match" do
      @user.password_confirmation = 'darcylover'
      expect(@user).not_to be_valid
    end
  end
end