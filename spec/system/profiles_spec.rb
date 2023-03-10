require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  describe 'プロフィールの表示と編集' do
    context '一般ユーザー' do
    let(:user) { create(:user) }

      context '正常系' do
        it 'プロフィールが表示される' do
          login_as(user)
          click_link 'プロフィール'
          expect(page).to have_content user.name
          expect(page).to have_content user.email
        end

        it 'プロフィールの編集ができる' do
          login_as(user)
          click_link 'プロフィール'
          visit edit_profile_path
          fill_in '名前', with: '名前編集'
          fill_in 'メールアドレス', with: 'edit@example.com'
          click_button '変更を保存'
          expect(current_path).to eq edit_profile_path
          expect(page).to have_content '名前編集'
          expect(page).to have_content 'edit@example.com'
        end
      end

      context '異常系' do
        it '入力が不足している場合、プロフィールの編集ができない（ユーザーネーム）' do
          login_as(user)
          click_link 'プロフィール'
          visit edit_profile_path
          fill_in '名前', with: ''
          click_button '変更を保存'
          expect(current_path).to eq edit_profile_path
          expect(page).to have_content 'ユーザーを更新できませんでした'
          expect(page).to have_content '名前を入力してください'
        end

        it '入力が不足している場合、プロフィールの編集ができない（email)' do
          login_as(user)
          click_link 'プロフィール'
          visit edit_profile_path
          fill_in '名前', with: 'ユーザー編集'
          fill_in 'メールアドレス', with: ''
          click_button '変更を保存'
          expect(current_path).to eq edit_profile_path
          expect(page).to have_content 'ユーザーを更新できませんでした'
          expect(page).to have_content 'メールアドレスを入力してください'
        end
      end
    end

    context 'ゲストユーザー' do
      let(:guest) { create(:user, :guest) }
      before { login_as(guest) }

      it 'ゲストユーザーの場合、メールアドレスが表示されない' do
        click_link 'プロフィール'
        expect(page).to have_content guest.name
        expect(page).not_to have_content guest.email
        visit edit_profile_path
        expect(current_path).to eq edit_profile_path
        expect(page).not_to have_content 'メールアドレス'
      end
    end
  end
end