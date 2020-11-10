class AddDetailsToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :birth_date, :date
    add_column :teachers, :sex, :integer
  end
end
