# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@coupa.com"
  end

  factory :user do
    email
    sequence(:first_name) {|n| "Hank #{n}"}
    sequence(:last_name) {|n| "Belvedere#{n}"}
    password 'changeme'
    password_confirmation 'changeme'
  end
end
