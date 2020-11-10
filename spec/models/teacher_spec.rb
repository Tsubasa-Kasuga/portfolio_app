require 'rails_helper'

RSpec.describe Teacher, type: :model do

  describe '正常系のテスト' do

    before do
      @teacher = FactoryBot.build(:teacher)
    end
    
    context 'ユーザー登録ができる場合' do
      it 'name, email, password, password_confirmationが正しく入力されていれば新規登録できる' do
        expect(@teacher).to be_valid
      end
    end
  end

  describe "バリデーションのテスト" do

    before do
      @teacher = FactoryBot.build(:teacher)
    end

    context '名前が未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.name = nil
        @teacher.valid? 
        expect(@teacher.errors.full_messages).to include("名前を入力してください")
      end
    end
    
    context 'Emailが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.email = nil
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Eメールを入力してください")
      end
    end

    context 'Emailがすでに使用されている場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.save
        another_teacher = FactoryBot.build(:teacher)
        another_teacher.email = @teacher.email
        another_teacher.valid?
        expect(another_teacher.errors.full_messages).to include("Eメールはすでに存在します")
      end
    end

    context 'パスワードが未入力の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.password = nil
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

    context 'パスワードが6文字以下の場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.password = "12345"
        @teacher.password_confirmation = "12345"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end

    context '確認用パスワードが一致しない場合' do
      it "登録されず、エラーメッセージが出ること" do
        @teacher.password_confirmation = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
