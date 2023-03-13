require 'rails_helper'

RSpec.describe 'Books', type: :system do
  describe '本のCRUD' do
    let(:me) { create(:user) }
    let(:book) { create(:book) }
    let(:book_by_me) { create(:book, user: me) }
    let(:author) { create(:author) }
    before { login_as(me) }

    context '正常系' do
      it '検索した本を新規追加できる' do
        visit search_books_path
        fill_in 'search', with: 'apple'
        click_button '検索'
        click_on 'この作品を投稿する', match: :first
        fill_in 'レビュー', with: 'レビュー内容'
        select '日本', from: 'book[country_id]'
        expect{ click_button '登録する' }.to change{ Book.count }.by(1)
        expect(current_path).to eq books_path
        expect(page).to have_content '投稿を作成しました'
      end
    end
  end
end