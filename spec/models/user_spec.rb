require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do

    describe 'Validations' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
    end

    it "should allow correct user info" do

      @good_user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "same@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@good_user).to be_valid
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
      @user = User.create(
        first_name: "test",
        last_name: "test",
        email: "a@a.com",
        password: "hello",
        password_confirmation: "hello"
        )
      @user2 = User.create(
        first_name: "test",
        last_name: "test",
        email: "a@a.com",
        password: "hello",
        password_confirmation: "hello"
        )
      expect(@user).not_to be_valid
    end

    it "should not allow passwords with less than 2 characters" do
      @user = User.create(
        first_name: "test",
        last_name: "test",
        email: "12@a.com",
        password: "1",
        password_confirmation: "1"
        )
      expect(@user).not_to be_valid
    end

    it "should not validate presense of case sensitivity" do

      @good_user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "sam@a.com",
        password: "hello",
        password_confirmation: "hello"
      )


      @dup_user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "SAM@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@dup_user).not_to be_valid
    end
  end

  describe "authentication" do
    it "should validate log in for existing user" do
      @dup_user = User.create(
        first_name: "Amna",
        last_name: "Zletni",
        email: "amna@a.com",
        password: "hello",
        password_confirmation: "hello"
      )
      @user = User.authenticate_with_credentials("amna@a.com", "hello")
      expect(@user).to be_instance_of(User)

    end

  end

end
