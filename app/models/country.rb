class Country < ApplicationRecord
  belongs_to :area
  has_many :prefectures
  has_many :books

  validates :name, presence: true
end
