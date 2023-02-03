require 'rails_helper'

RSpec.describe Area, type: :model do
  describe 'バリデーション確認' do
    it '有効であること' do
      area = build(:area)
      expect(area).to be_valid
      expect(area.errors).to be_empty
    end

    it '名前がない場合、無効' do
      area = build(:area, name: nil)
      expect(area).to be_invalid
      expect(area.errors[:name]).to eq ["を入力してください"]
    end
  end
end