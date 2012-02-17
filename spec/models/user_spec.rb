# encoding: utf-8
require 'spec_helper'

describe "Given User" do

  describe "with employee attributes" do

    before(:each) do
      @employee_attr = {
          :email                 => "user@model.test",
          :password              => "foobar",
          :password_confirmation => "foobar",
          :first_name            => "Frank",
          :last_name             => "Testa",
          :street                => "Finksweg",
          :house_number          => "1a",
          :zip_code              => "21128",
          :city                  => "Stade",
          :phone                 => "04021112",
          :mobile_phone          => "01279987",
          :employee              => true
      }
    end

    it "should create a new instance as employee" do
      @employee = User.create!(@employee_attr)
      @employee.employee?.should be_true
    end

  end


  describe "with user attributes" do

    before(:each) do
      @user_attr = {
          :email                 => "user@model.test",
          :password              => "foobar",
          :password_confirmation => "foobar",
          :employee              => 0
      }

    end

    it "should create a new instance" do
      User.create!(@user_attr)
    end

    describe "email" do

      it "should require an email address" do
        no_email_user = User.new(@user_attr.merge(:email => ""))
        no_email_user.should_not be_valid
      end

      it "email == nil, then user is not valid" do
        user = User.new(@user_attr.merge(:email => nil))
        user.should_not be_valid
      end

      it "should accept valid email addresses" do
        addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        addresses.each do |address|
          valid_email_user = User.new(@user_attr.merge(:email => address))
          valid_email_user.should be_valid
        end
      end

      it "should reject invalid email addresses" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        addresses.each do |address|
          invalid_email_user = User.new(@user_attr.merge(:email => address))
          invalid_email_user.should_not be_valid
        end
      end

      it "should reject duplicate email addresses" do
        User.create!(@user_attr)
        user_with_duplicate_email = User.new(@user_attr)
        user_with_duplicate_email.should_not be_valid
      end

      it "should reject email addresses identical up to case" do
        upcased_email = @user_attr[:email].upcase
        User.create!(@user_attr.merge(:email => upcased_email))
        user_with_duplicate_email = User.new(@user_attr)
        user_with_duplicate_email.should_not be_valid
      end

    end

    describe "passwords" do

      before(:each) do
        @user = User.new(@user_attr)
      end

      it "should have a password attribute" do
        @user.should respond_to(:password)
      end

      it "should have a password confirmation attribute" do
        @user.should respond_to(:password_confirmation)
      end
    end

    describe "password validations" do

      it "should require a password" do
        User.new(@user_attr.merge(:password => "", :password_confirmation => "")).
            should_not be_valid
      end

      it "should require a matching password confirmation" do
        User.new(@user_attr.merge(:password_confirmation => "invalid")).
            should_not be_valid
      end

      it "should reject short passwords" do
        short = "a" * 5
        hash  = @user_attr.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end

    end

    describe "password encryption" do

      before(:each) do
        @user = User.create!(@user_attr)
      end

      it "should have an encrypted password attribute" do
        @user.should respond_to(:encrypted_password)
      end

      it "should set the encrypted password attribute" do
        @user.encrypted_password.should_not be_blank
      end

    end

  end
end
