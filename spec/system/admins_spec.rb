require 'rails_helper'

RSpec.describe "Admins", type: :system do
  describe '管理者認証のテスト' do

    it '新規登録できない' do
      expect {visit new_admin_registration_path }.to raise_error(NameError)
    end

    context '管理者ログイン' do
      before do
        @admin = FactoryBot.create(:admin)
        visit new_admin_session_path
      end

      it 'ログインに成功する' do
        fill_in "Eメール", with: @admin.email
        fill_in 'パスワード', with: @admin.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content '管理機能'
      end

      it 'ログインに失敗する' do
        fill_in 'Eメール', with: ''
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_admin_session_path
      end
    end
  end

  describe '編集のテスト' do

    before do
      @admin = FactoryBot.create(:admin)
      visit new_admin_session_path
      fill_in "Eメール", with: @admin.email
      fill_in 'パスワード', with: @admin.password
      click_button 'ログイン'
      visit edit_admin_registration_path
    end

    context '編集画面で編集する' do
      it '編集が成功する' do
        expect(current_path).to eq edit_admin_registration_path
        fill_in "Eメール", with: 'change@example.com'
        fill_in '現在のパスワード', with: @admin.password
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(page).to have_content '管理機能'
        change(Admin, :count).by(0)
        email = Admin.find(@admin.id).email 
        expect(email).to eq 'change@example.com'
      end
    
      it '編集が失敗する' do
        fill_in '現在のパスワード', with: ''
        click_button '更新'
        expect(page).to have_content '現在のパスワードを入力してください'
        expect(page).to have_content 'アカウント編集'
      end
    end 
  end 
end
