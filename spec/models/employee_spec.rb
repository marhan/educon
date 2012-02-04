# encoding: utf-8
require 'spec_helper'

describe Employee do

  before do
    @attr = {
        :first_name   => "Frank",
        :last_name    => "Testa",
        :street       => "Finksweg",
        :house_number => "1a",
        :zip_code     => "21128",
        :city         => "Stade",
        :phone        => "04021112",
        :mobile_phone => "01279987",
        :email        => "frank.testa@domain.com" }
  end

  it "should be created successfully with valid data" do
    Employee.create!(@attr)
  end


  describe "is created with" do

    it "email == 'invalid_email', then employee is not valid" do
      employee = Employee.new(@attr.merge(:email => 'invalid_email'))
      employee.should_not be_valid
    end

    it "email == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:email => nil))
      employee.should_not be_valid
    end

    it "email == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:email => ''))
      employee.should_not be_valid
    end

    it "firstname == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:first_name => nil))
      employee.should_not be_valid
    end

    it "firstname == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:first_name => ""))
      employee.should_not be_valid
    end

    it "lastname == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:last_name => nil))
      employee.should_not be_valid
    end

    it "lastname == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:last_name => ""))
      employee.should_not be_valid
    end

    it "street == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:street => nil))
      employee.should_not be_valid
    end

    it "street == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:street => ""))
      employee.should_not be_valid
    end

    it "house_number == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:house_number => nil))
      employee.should_not be_valid
    end

    it "house_number == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:house_number => ""))
      employee.should_not be_valid
    end

    it "city == nil, then employee is not valid" do
      employee = Employee.new(@attr.merge(:city => nil))
      employee.should_not be_valid
    end

    it "city == empty, then employee is not valid" do
      employee = Employee.new(@attr.merge(:city => ""))
      employee.should_not be_valid
    end


  end

end