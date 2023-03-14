class RemoveAssignmentFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :assignment, index: true, foreign_key: true
  end
end
