require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it '名前、メール、パスワードがあれば有効な状態であること' do
      user = create(:user)
      expect(user).to be_valid
    end

    it '名前がなければ無効な状態であること' do
      user = build(:user, name: '')
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'メールアドレスがなければ無効な状態であること' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'パスワードが2文字では無効な状態であること' do
      user = build(:user, password: 'fo')
      user.valid?
      expect(user.errors[:password]).to include('は3文字以上で入力してください')
    end

    it 'パスワードが3文字あれば有効な状態であること' do
      user = build(:user, password: 'foo')
      user.valid?
      expect(user.errors[:password]).not_to include('iは3文字以上で入力してください')
    end

    it '重複するメールアドレスは無効であること' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end
  end
end
