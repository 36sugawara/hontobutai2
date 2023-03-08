class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :user_books, dependent: :destroy, foreign_key: 'user_id'
  has_many :books, through: :user_books
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_books, through: :bookmarks, source: :book

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  enum role: { general: 0, admin: 1, guest: 2 }

  def own?(object)
    id == object.user_id
  end

  def bookmark(book)
    bookmark_books << book
  end

  def unbookmark(book)
    bookmark_books.destroy(book)
  end

  def bookmark?(book)
    bookmark_books.include?(book)
  end
end
