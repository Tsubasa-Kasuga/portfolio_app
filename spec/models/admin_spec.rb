require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe '正常系のテスト' do

    before do
      @admin = FactoryBot.build(:admin)
    end
    
    context 'ユーザー登録ができる場合' do
      it 'name, email, password, password_confirmationが正しく入力されていれば新規登録できる' do
        expect(@admin).to be_valid
      end
    end
  end

  describe "バリデーションのテスト" do

    before do
      @admin = FactoryBot.build(:admin)
    end

    context 'Emailが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @admin.email = nil
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Eメールを入力してください")
      end
    end

    context 'Emailがすでに使用されている場合' do
      it "登録されず、エラーメッセージが出ること" do
        @admin.save
        another_admin = FactoryBot.build(:admin)
        another_admin.email = @admin.email
        another_admin.valid?
        expect(another_admin.errors.full_messages).to include("Eメールはすでに存在します")
      end
    end

    context 'パスワードが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @admin.password = nil
        @admin.valid?
        expect(@admin.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

    context 'パスワードが6文字以下の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @admin.password = "12345"
        @admin.password_confirmation = "12345"
        @admin.valid?
        expect(@admin.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end

    context '確認用パスワードが一致しない場合' do
      it "登録されず、エラーメッセージが出ること" do
        @admin.password_confirmation = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end