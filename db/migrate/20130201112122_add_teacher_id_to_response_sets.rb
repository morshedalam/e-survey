class AddTeacherIdToResponseSets < ActiveRecord::Migration
  def change
    add_column :response_sets, :teacher_id, :integer
  end
end
