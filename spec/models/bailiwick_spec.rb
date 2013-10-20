require 'spec_helper'

describe Bailiwick do
  it "has a valid factory" do
    FactoryGirl.build(:bailiwick).should be_valid
  end
  it "is invalid without a user" do
    FactoryGirl.build(:bailiwick, :user => nil).should be_invalid
  end
  it {FactoryGirl.build(:bailiwick, :topic => nil).should be_invalid}
  it {FactoryGirl.build(:bailiwick, :role => nil).should be_invalid}
  it 'must have a role available in the topic' do
    FactoryGirl.build(:bailiwick, role: 'something').should be_invalid
    FactoryGirl.build(:bailiwick, role: 'development').should be_valid
  end

  it "is invalid without a rank" do
    FactoryGirl.build(:bailiwick, :rank => nil).should be_invalid
  end
  it "is invalid without a proper rank" do
    FactoryGirl.build(:bailiwick, :rank => "rager").should be_invalid
  end
  it "is invalid without an affinity" do
    FactoryGirl.build(:bailiwick, :affinity => nil).should be_invalid
  end
  it "is invalid without a proper affinity" do
    FactoryGirl.build(:bailiwick, :affinity => "rager").should be_invalid
  end

end
