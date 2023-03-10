class Book < ApplicationRecord
  mount_uploader :book_image, BookImageUploader
  belongs_to :user
  belongs_to :country
  belongs_to :prefecture, optional: true
  has_many :user_books, dependent: :destroy, foreign_key: 'book_id'
  has_many :users, through: :user_books
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { in: 5..200 }
  validates :user_id, presence: true
  validates :country_id, presence: true
  validates :prefecture_id, length: { maximum: 2 }, allow_blank: true

  #booksコントローラーのceateメソッド実行時に同時に実行してauthorsを保存するためのメソッド。
  def save_with_author(authors)
    ActiveRecord::Base.transaction do
      self.save!
      #一覧から重複削除してnilを除去し、条件を指定して初めの1件を取得し1件もなければ作成する。
      self.authors = authors.uniq.reject(&:blank?).map { |name| Author.find_or_initialize_by(name: name.strip) } unless authors.nil?
    end
    true
    rescue StandardError
      false
  end
end
