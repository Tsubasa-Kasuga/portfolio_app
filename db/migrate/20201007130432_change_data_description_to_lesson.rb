class ChangeDataDescriptionToLesson < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :description, :text
  end
end
