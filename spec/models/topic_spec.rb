require 'spec_helper'

describe Topic do
  it "has a valid factory" do
    FactoryGirl.build(:topic).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:topic, :name => nil).should be_invalid
  end
  it "is invalid without a unique name" do
    @topic = FactoryGirl.create(:topic)
    FactoryGirl.build(:topic, :name => @topic.name).should be_invalid
  end

  it "has many bailiwicks"
end
