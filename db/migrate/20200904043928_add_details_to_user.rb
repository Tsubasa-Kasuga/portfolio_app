class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :date
    add_column :users, :sex, :integer
    add_column :users, :role, :integer
  end
end
