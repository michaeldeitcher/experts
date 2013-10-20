# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bailiwick do |b|
    b.user
    b.topic
    b.affinity 'seasoned'
    b.rank 'primary'
    b.role 'development'
  end
end
