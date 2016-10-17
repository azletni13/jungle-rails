require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    before :each do
      @user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "amna@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
    end



    describe 'Validations' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
    end

    it "should allow correct user info" do
      expect(@user).to be_valid
    end

    it "should validate the passwords match" do
      @bad_user = User.create(
        first_name: "sam",
        last_name: "bob",
        email: "sambad@a.com",
        password: "hello",
        password_confirmation: "hello2"
      )
      expect(@bad_user).not_to be_valid
    end

    it "should not allow the absence of password" do
      @user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "asfasf@a.com",
        password: nil,
        password_confirmation: "hello"
      )
      expect(@user).not_to be_valid
    end

    it "should not allow the absence of password_confirmation" do
      @user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "asdasd@a.com",
        password: "hello",
        password_confirmation: nil
      )
      expect(@user).not_to be_valid
    end

    it "should validate uniqueness of email" do
      @user2 = User.create(
        first_name: "test",
        last_name: "test",
        email: "amna@a.com",
        password: "hello",
        password_confirmation: "hello"
        )
      expect(@user2).not_to be_valid
    end

    it "should not allow passwords with less than 2 characters" do
      @user_password = User.create(
        first_name: "test",
        last_name: "test",
        email: "12@a.com",
        password: "1",
        password_confirmation: "1"
        )
      expect(@user_password).not_to be_valid
    end

    it "should not validate presense of case sensitivity" do
      @dup_user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "Amna@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@dup_user).not_to be_valid
    end
  end

  context "authentication" do
     before :each do
      @user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "amna@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
    end

    it "should validate log in for existing user" do
      @user = User.authenticate_with_credentials("amna@a.com", "hello")
      expect(@user).to be_instance_of(User)

    end

    it "should not validate log in for non-existing user" do
      @user = User.authenticate_with_credentials("alfjs@jfds.com", "hello")
      expect(@user).not_to be_instance_of(User)
    end

    it "should validate log in if user types in space before or after" do
      @user = User.authenticate_with_credentials(" amna@a.com", "hello")
      expect(@user).to be_instance_of(User)
    end

    it "should validate log in if user types in wrong case" do
       @user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "AmNa@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
      @user = User.authenticate_with_credentials("AMnA@a.com", "hello")
      expect(@user).to be_instance_of(User)
    end

  end


end
