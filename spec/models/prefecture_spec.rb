require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe 'バリデーション確認' do
    it '有効であること' do #「got errors: Countryを入力してください」となってしまう
      prefecture = build(:prefecture)
      expect(prefecture).to be_valid
      expect(prefecture.errors).to be_empty
    end

    it '名前がない場合、無効' do
      prefecture = build(:prefecture, name: nil)
      expect(prefecture).to be_invalid
      expect(prefecture.errors[:name]).to eq ["を入力してください"]
    end
  end
end