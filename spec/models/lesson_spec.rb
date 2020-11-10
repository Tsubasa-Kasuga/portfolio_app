require 'rails_helper'

RSpec.describe Lesson, type: :model do
  
  describe "正常系のテスト" do
    
    before do
      @teacher = FactoryBot.create(:teacher)
      @lesson = FactoryBot.build(:lesson)
    end
    
    it "正しく入力されていれば、登録できること" do
      @lesson.teacher_id = @teacher.id
      expect(@lesson.save).to be true
    end
  end

  describe "バリデーションのテスト" do
    before do
      @lesson = FactoryBot.build(:lesson)
    end

    context "タイトルが未入力の場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.title = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンのタイトルを入力してください")
      end
    end

    context "タイトルが5文字より少ない場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.title = "a" * 4
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンのタイトルは5文字以上で入力してください")
      end
    end

    context "タイトルが20文字を超える場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.title = "a" * 21
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンのタイトルは20文字以内で入力してください")
      end
    end

    context "説明が未入力の場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.description = ""
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンの説明を入力してください")
      end
    end

    context "説明が50文字より少ない場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.description = "a" * 49
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンの説明は50文字以上で入力してください")
      end
    end

    context "説明が2000文字を超える場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.description = "a" * 2001
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスンの説明は2000文字以内で入力してください")
      end
    end

    context "レッスンコースが選択されていない場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.frequency = ""
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("コースを入力してください")
      end
    end

    context "レッスン時間が選択されていない場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.time = ""
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("レッスン時間を入力してください")
      end
    end

    context "レッスン料金が選択されていない場合" do
      it "登録されず、エラーメッセージが出ること" do
        @lesson.price = ""
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("料金を入力してください")
      end
    end
  end
end