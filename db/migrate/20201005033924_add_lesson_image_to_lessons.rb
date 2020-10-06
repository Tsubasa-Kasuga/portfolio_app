class AddLessonImageToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :lessonImage, :string
  end
end
