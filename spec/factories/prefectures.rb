FactoryBot.define do
  factory :prefecture do
    sequence(:id, 1)
    sequence(:country_id, 1)
    sequence(:name, '北海道')
  end
end