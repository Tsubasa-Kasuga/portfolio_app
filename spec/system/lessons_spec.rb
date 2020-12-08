require 'rails_helper'

RSpec.describe "Lessons", type: :system do

  describe 'レッスン一覧ページ' do

    context '開講中のレッスンがないとき' do

      before do
        @teacher = FactoryBot.create(:teacher)
        @lesson1 = FactoryBot.create(:sysLesson1, teacher_id: @teacher.id, approval: false, deleted: false)
        visit lessons_path
      end

      it 'レッスンが表示されない' do
        expect(page).to have_content "レッスンが見つかりません。"
        expect(page).not_to have_content 'システムテストレッスン１タイトル'
        expect(page).not_to have_content  @teacher.name
      end
    end

    context '開講中のレッスンがあるとき' do

      before do
        @teacher = FactoryBot.create(:teacher)
        @lesson1 = FactoryBot.create(:sysLesson1, teacher_id: @teacher.id, approval: true, deleted: false)
        @lesson2 = FactoryBot.create(:sysLesson2, teacher_id: @teacher.id, approval: true, deleted: false)
        visit lessons_path
      end
      it 'レッスン一覧が表示される' do
        expect(page).to have_content 'システムテストレッスン１タイトル'
        expect(page).to have_content 'システムテストレッスン2タイトル'
        expect(page).to have_content  @teacher.name
      end

      it 'レッスン詳細ページが表示される' do
        find('h2', text: 'システムテストレッスン１タイトル').click
        expect(current_path).to eq lesson_path(@lesson1)
      end
      

      it 'ページネーションが表示されていない' do
        expect(page).not_to have_content '前へ'
        expect(page).not_to have_content '次へ'
      end

      it '検索ワードに該当するレッスンの結果が表示される' do
        fill_in 'search', with: "テストレッスン１"
        click_button '検索'
        expect(page).to have_content 'システムテストレッスン１タイトル'
        expect(page).not_to have_content 'システムテストレッスン2タイトル'
      end

      it '検索ワードに該当するレッスンがない場合の表示確認' do
        fill_in 'search', with: "ない場合"
        click_button '検索'
        expect(page).to have_content "レッスンが見つかりません。"
        expect(page).not_to have_content 'システムテストレッスン１タイトル'
        expect(page).not_to have_content 'システムテストレッスン2タイトル'
      end

    end

    context '開講中のレッスンがあるとき（７件以上）' do

      before do
        @teacher = FactoryBot.create(:teacher)
        create_list(:sysLesson1, 7, teacher_id: @teacher.id, approval: true, deleted: false)
        visit lessons_path
      end

      it 'ページネーションが表示されている' do
        expect(page).to have_content '前へ'
        expect(page).to have_content '次へ'
      end
    end
  end 
end
