require 'rails_helper'

RSpec.describe 'Bookmarks', type: :system do
  describe 'ブックマーク機能' do
    let(:me) { create(:user) }
    let(:book) { create(:book) }
    let(:like_by_me) { create(:bookmark, user: me) }
    before { login_as(me) }

    context '正常系' do
      it 'ブックマークできる' do
        visit book_path(book)
        expect(page).not_to have_selector 'fa-solid fa-heart fa-lg'
        expect{
          find('fa-regular fa-heart fa-lg').click
          expect(page).to have_selector 'fa-solid fa-heart fa-lg'
        }
        expect(current_path).to eq book_path(book)
      end

      it 'ブックマーク解除できる' do
        visit book_path(like_by_me.book)
        expect(page).not_to have_selector 'fa-solid fa-heart fa-lg'
        expect{
          find('fa-solid fa-heart fa-lg').click
          expect(page).to have_selector 'fa-solid fa-heart fa-lg'
        }
        expect(current_path).to eq book_path(like_by_me.book)
      end
    end
  end
end