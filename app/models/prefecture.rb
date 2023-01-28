class Prefecture < ApplicationRecord
  belongs_to :country
  has_many :books

  validates :name, presence: true
end
