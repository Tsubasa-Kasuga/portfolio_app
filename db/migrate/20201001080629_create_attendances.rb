class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.boolean :termination
      t.boolean :deleted

      t.timestamps
    end
  end
end
