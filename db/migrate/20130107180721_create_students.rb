class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :department_name
      t.date :admitted_at

      t.timestamps
    end
  end
end
