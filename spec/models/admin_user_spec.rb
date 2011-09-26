require 'spec_helper'

describe AdminUser do

  before(:each) do
    @attr = {
        :email                 => "admin_user@model.test",
        :password              => "foobar",
        :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    AdminUser.create!(@attr)
  end

  describe "email" do

    it "should require an email address" do
      no_email_admin_user = AdminUser.new(@attr.merge(:email => ""))
      no_email_admin_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[admin_user@foo.com THE_ADMIN_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_admin_user = AdminUser.new(@attr.merge(:email => address))
        valid_email_admin_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[admin_user@foo,com admin_user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_admin_user = AdminUser.new(@attr.merge(:email => address))
        invalid_email_admin_user.should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
      AdminUser.create!(@attr)
      admin_user_with_duplicate_email = AdminUser.new(@attr)
      admin_user_with_duplicate_email.should_not be_valid
    end

    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      AdminUser.create!(@attr.merge(:email => upcased_email))
      admin_user_with_duplicate_email = AdminUser.new(@attr)
      admin_user_with_duplicate_email.should_not be_valid
    end

  end

  describe "passwords" do

    before(:each) do
      @admin_user = AdminUser.new(@attr)
    end

    it "should have a password attribute" do
      @admin_user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @admin_user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      AdminUser.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
    end

    it "should require a matching password confirmation" do
      AdminUser.new(@attr.merge(:password_confirmation => "invalid")).
          should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash  = @attr.merge(:password => short, :password_confirmation => short)
      AdminUser.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @admin_user = AdminUser.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @admin_user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @admin_user.encrypted_password.should_not be_blank
    end

  end
end
