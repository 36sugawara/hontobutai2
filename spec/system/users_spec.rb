require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録が完了しました'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end

    context '名前が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end

    context 'パスワードが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: ''
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワードは6文字以上で入力してください'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end

    context 'パスワード確認が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: ''
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワード確認を入力してください'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end

    context 'パスワードが不一致' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'pass'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end

    context '登録済のメールアドレスを使用' do
      it 'ユーザーの新規作成が失敗する' do
        existed_user = FactoryBot.create(:user)
        visit new_user_path
        fill_in '名前', with: 'Example'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(page).to have_current_path new_user_path, ignore_query: true
      end
    end
  end
end