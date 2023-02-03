FactoryBot.define do
  factory :bookmark do
    association :user
    association :book
  end
end