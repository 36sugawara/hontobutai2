FactoryBot.define do
  factory :book do
    sequence(:title, "title_1")
    body { 'レビュー内容です' }
    published_date { "2023-02-03" }
    info_link { 'https://google.com' }
    book_image { 'https://google.com' }
    association :country
    association :prefecture
  end
end