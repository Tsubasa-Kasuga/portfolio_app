require 'rails_helper'

RSpec.describe User, type: :model do

  describe '正常系のテスト' do

    before do
      @user = FactoryBot.build(:user)
    end
    
    context 'ユーザー登録ができる場合' do
      it 'name, email, password, password_confirmationが正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
  end

  describe "バリデーションのテスト" do

    before do
      @user = FactoryBot.build(:user)
    end

    context '名前が未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.name = nil
        @user.valid? 
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
    end
    
    context 'Emailが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
    end

    context 'Emailがすでに使用されている場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
    end

    context 'パスワードが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

    context 'パスワードが6文字以下の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end

    context '確認用パスワードが一致しない場合' do
      it "登録されず、エラーメッセージが出ること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end