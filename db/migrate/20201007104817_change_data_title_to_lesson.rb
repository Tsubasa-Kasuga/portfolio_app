class ChangeDataTitleToLesson < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :title, :text
  end
end
