# encoding: utf-8
require 'spec_helper'

describe Client do

  before do
    @attr = {
        :email           => "frank.testa@domain.com",
        :firstname       => "Frank",
        :lastname        => "Testa",
        :street          => "Finksweg",
        :house_number    => "1a",
        :zip_code        => "21128",
        :city            => "Stade",
        :fon             => "04021112",
        :mobil           => "01279987",
        :nationality     => "de",
        :spoken_language => "en" }
  end

  it "should create new client with valid data" do
    Client.create!(@attr)
  end

  describe "is created with" do

    it "email == 'invalid_email', then client is not valid" do
      client = Client.new(@attr.merge(:email => 'invalid_email'))
      client.should_not be_valid
    end

    it "firstname == nil, then client is not valid" do
      client = Client.new(@attr.merge(:firstname => nil))
      client.should_not be_valid
    end

    it "firstname == empty, then client is not valid" do
      client = Client.new(@attr.merge(:firstname => ""))
      client.should_not be_valid
    end

    it "lastname == nil, then client is not valid" do
      client = Client.new(@attr.merge(:lastname => nil))
      client.should_not be_valid
    end

    it "lastname == empty, then client is not valid" do
      client = Client.new(@attr.merge(:lastname => ""))
      client.should_not be_valid
    end

    it "street == nil, then user is not valid" do
      user = User.new(@attr.merge(:street => nil))
      user.should_not be_valid
    end

    it "street == empty, then user is not valid" do
      user = User.new(@attr.merge(:street => ""))
      user.should_not be_valid
    end

    it "house_number == nil, then user is not valid" do
      user = User.new(@attr.merge(:house_number => nil))
      user.should_not be_valid
    end

    it "house_number == empty, then user is not valid" do
      user = User.new(@attr.merge(:house_number => ""))
      user.should_not be_valid
    end

    it "city == nil, then user is not valid" do
      user = User.new(@attr.merge(:city => nil))
      user.should_not be_valid
    end

    it "city == empty, then user is not valid" do
      user = User.new(@attr.merge(:city => ""))
      user.should_not be_valid
    end

  end
end