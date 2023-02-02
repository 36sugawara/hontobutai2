FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }

    trait :guest do
      role { :guest }
    end

    trait :general do
      sequence(:email) { |n| "general_#{n}@example.com" }
      role { :general }
    end
  end
end
