require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "it creates a user when password and password_confirmation fields match" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save

      expect(User.all.count).to eq(1)
    end

    it "it doesn't create a user if password and password_confirmation fields don't match" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password123")
      @user.save

      expect(User.all.count).to eq(0)
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "it doesn't create a user if a email already exists in the database" do 
      @user1 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user1.save
      expect(User.all.count).to eq(1)

      @user2 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user2.save
  
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "it requires a email to create a user" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: nil, password: "password", password_confirmation:"password")
      @user.save
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "it requires a first name to create a user" do 
      @user = User.new(first_name: nil, last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "it requires a last name to create a user" do 
      @user = User.new(first_name: "first_name", last_name: nil, email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "it requires the password to have a minimum length of 8 characters to create a user" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass123", password_confirmation:"pass123")
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
    end

  end

  describe '.authenticate_with_credentials' do
    it "it requires email and password authentication to log in" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("test@test.com", "password")).to be_truthy 
    end

    it "it should allow a user to log in with spaces before the email address" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("  test@test.com", "password")).to be_truthy
    
    end

    it "it should allow a user to log in if the email address has the wrong case" do 
      @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("TeSt@teSt.coM", "password")).to be_truthy
    
    end
  end
end
