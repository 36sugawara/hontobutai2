class Area < ApplicationRecord
  has_many :countries

  validates :name, presence: true
end
