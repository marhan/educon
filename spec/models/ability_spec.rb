# encoding: utf-8
require 'spec_helper'
require "cancan/matchers"

describe Ability do

  describe "Given User" do
    subject { ability }
    let(:ability) { Ability.new(user) }

    context "when is an account manager" do
      let(:user) { FactoryGirl.create(:user) }
      it { should be_able_to(:manage, User.new) }
    end

  end

end