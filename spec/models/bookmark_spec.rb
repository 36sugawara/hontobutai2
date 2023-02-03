require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'バリデーション確認' do
    let(:created_bookmark) { create(:bookmark) }

    it '有効であること' do
      bookmark = build(:bookmark)
      expect(bookmark).to be_valid
      expect(bookmark.errors).to be_empty
    end

    #it '重複している組み合わせの場合、無効' do #「ActiveRecord::RecordInvalid:バリデーションに失敗しました: Areaを入力してください」というエラーが出る
    #  bookmark = build(:bookmark, user: created_bookmark.user, book: created_bookmark.book)
    #  expect(bookmark).to be_invalid
    #  expect(bookmark.errors[:user_id]).to eq ["はすでに存在します"]
    #end
  end
end