FactoryBot.define do
  factory :country do
    sequence(:id, 1)
    sequence(:area_id, 1)
    sequence(:name, '日本')
  end
end