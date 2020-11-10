class AddAvatarToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :avatar, :string
  end
end
