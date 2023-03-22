class AddDueDateToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :due_date, :datetime
    change_column_default :expenses, :status, 0
  end
end
