require 'rails_helper'

RSpec.describe "Teachers", type: :system do
  describe '講師認証のテスト' do
    context '講師新規登録' do

      before do
        visit new_teacher_registration_path
      end

      it '新規登録に成功する' do
        fill_in 'ユーザー名', with: "テスト先生"
        fill_in 'Eメール', with: "testsensei@example.com"
        select '1990', from: 'teacher_birth_date_1i'
        select '10', from: 'teacher_birth_date_2i'
        select '5', from: 'teacher_birth_date_3i'
        choose 'teacher_sex_男性'
        fill_in 'パスワード', with: "testtaro", match: :first
        fill_in 'パスワード（確認用）', with: "testtaro"
        expect { click_button '会員登録' }.to change(Teacher, :count).by(1)
        expect(page).to have_content 'アカウント登録が完了しました。'
        expect(page).to have_content 'テスト先生'
      end

      it '新規登録に失敗する' do
        fill_in 'ユーザー名', with: ""
        fill_in 'Eメール', with: ""
        select '1990', from: 'teacher_birth_date_1i'
        select '10', from: 'teacher_birth_date_2i'
        select '5', from: 'teacher_birth_date_3i'
        choose 'teacher_sex_女性'
        fill_in 'パスワード', with: "testtaro", match: :first
        fill_in 'パスワード（確認用）', with: "testtaro"
        expect { click_button '会員登録' }.to change(Teacher, :count).by(0)
        expect(page).not_to have_content 'アカウント登録が完了しました。'
        expect(current_path).to eq new_teacher_registration_path
      end
    end

    context '講師ログイン' do
      before do
        @teacher = FactoryBot.create(:teacher)
        visit new_teacher_session_path
      end

      it 'ログインに成功する' do
        fill_in "Eメール", with: @teacher.email
        fill_in 'パスワード', with: @teacher.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content @teacher.name
      end

      it 'ログインに失敗する' do
        fill_in 'Eメール', with: ''
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_teacher_session_path
      end
    end
  end

  describe '講師のテスト' do
    before do
      visit new_teacher_session_path
    end

    context 'マイページのテスト' do
      before do
        @teacher = FactoryBot.create(:teacher)
        visit new_teacher_session_path
        fill_in "Eメール", with: @teacher.email
        fill_in 'パスワード', with: @teacher.password
        click_button 'ログイン'
      end

      it 'ヘッダーが変更されている' do
        expect(page).to have_content('マイページ')
        expect(page).to have_content('アカウント編集')
      end
    end
  end

  describe '編集のテスト' do

    before do
      @teacher = FactoryBot.create(:teacher)
      visit new_teacher_session_path
      fill_in "Eメール", with: @teacher.email
      fill_in 'パスワード', with: @teacher.password
      click_button 'ログイン'
      visit edit_teacher_registration_path
    end

    context '編集画面で編集する' do
      it '編集が成功する' do
        expect(current_path).to eq edit_teacher_registration_path
        fill_in 'ユーザー名', with: '三郎'
        fill_in '現在のパスワード', with: @teacher.password
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(page).to have_content '三郎'
        expect(current_path).to eq teacher_path(@teacher)
      end
    
      it '編集が失敗する' do
        fill_in 'ユーザー名', with: '三郎'
        fill_in '現在のパスワード', with: ''
        click_button '更新'
        expect(page).to have_content '現在のパスワードを入力してください'
        expect(page).to have_content 'アカウント編集'
      end
    end 
  end 
end
