require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  it 'requires an valid email' do
    FactoryGirl.build(:user, :email => nil).should be_invalid
  end

  describe "requires the email address end with @test.com" do
    before(:each) do
      Preferences.stub(:email_limit_to_domain){'test.com'}
    end
    it {FactoryGirl.build(:user, :email => 'mikeD@example.com').should be_invalid}
    it {FactoryGirl.build(:user, :email => 'mikeD@test.com').should be_valid}
  end

  it {FactoryGirl.build(:user, :first_name => nil).should be_invalid}
  it {FactoryGirl.build(:user, :last_name => nil).should be_invalid}

  describe "roles" do
    before(:each) do
      @user = FactoryGirl.build(:user)
      @user.roles = ['development']
      @user.save!
    end
    it do
      @user.reload.roles.should == ['development']
    end
  end

  describe "scopes" do
    before(:each) {@bailiwick = FactoryGirl.create(:bailiwick)}
    it {@bailiwick.user.bailiwicks.all.should == [@bailiwick]}
  end
end
