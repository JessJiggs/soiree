class UpdateDefaultOnStatusTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :status, 0
  end
end
