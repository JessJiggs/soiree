class AddStatusToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :status, :integer
  end
end
