class Book < ApplicationRecord
  mount_uploader :book_image, BookImageUploader
  belongs_to :user
  belongs_to :country
  belongs_to :prefecture, optional: true
  has_many :user_books, dependent: :destroy, foreign_key: 'book_id'
  has_many :users, through: :user_books
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  validates :country_id, presence: true
  validates :prefecture_id, length: { maximum: 2 }, allow_blank: true

  def save_with_author(authors)
    ActiveRecord::Base.transaction do
      self.save!
      self.authors = authors.uniq.reject(&:blank?).map { |name| Author.find_or_initialize_by(name: name.strip) } unless authors.nil?
    end
    true
    rescue StandardError
      false
  end
end
