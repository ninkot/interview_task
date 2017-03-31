class AddIndexToPaymentsStudentId < ActiveRecord::Migration
  def change
    add_index :payments, :student_id
  end
end
