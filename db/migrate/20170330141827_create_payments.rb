class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student
      t.date :deadline
      t.date :paid_at
      t.decimal :price, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
