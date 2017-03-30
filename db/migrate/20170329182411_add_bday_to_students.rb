class AddBdayToStudents < ActiveRecord::Migration
  def change
    add_column :students, :bday, :date
  end
end
