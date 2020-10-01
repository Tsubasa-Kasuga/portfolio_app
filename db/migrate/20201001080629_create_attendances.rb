class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :user_id, :null => false
      t.integer :lesson_id, :null => false
      t.boolean :termination, :null => false, :default => false
      t.boolean :deleted, :null => false, :default => false

      t.timestamps
    end
    
  end
end
