class AddDefaultToLessons < ActiveRecord::Migration[6.0]
  def change
    # デフォルト値を追加
    change_column_default :lessons, :approval, false
    change_column_default :lessons, :deleted, false

    # NULL制約を追加
    change_column_null :lessons, :title, false
    change_column_null :lessons, :description, false
    change_column_null :lessons, :teacher_id, false
    change_column_null :lessons, :approval, false
    change_column_null :lessons, :deleted, false
  end
end
