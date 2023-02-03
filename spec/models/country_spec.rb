require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'バリデーション確認' do
    #it '有効であること' do #「got errors: Areaを入力してください」となってしまう
    #  country = build(:country)
    #  expect(country).to be_valid
    #  expect(country.errors).to be_empty
    #end

    it '名前がない場合、無効' do
      country = build(:country, name: nil)
      expect(country).to be_invalid
      expect(country.errors[:name]).to eq ["を入力してください"]
    end
  end
end