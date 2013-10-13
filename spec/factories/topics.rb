# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do |t|
    sequence(:name) {|n| "Topic #{n}" }
  end
end
