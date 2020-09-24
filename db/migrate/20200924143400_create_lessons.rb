class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.integer :time
      t.integer :price
      t.integer :frequency
      t.integer :teacher_id
      t.boolean :approval
      t.boolean :deleted

      t.timestamps
    end
  end
end
