class AddTaskToAssignment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assignments, :task, null: false, foreign_key: true
  end
end
