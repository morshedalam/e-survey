class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :department_name
      t.date :joined_at

      t.timestamps
    end
  end
end
