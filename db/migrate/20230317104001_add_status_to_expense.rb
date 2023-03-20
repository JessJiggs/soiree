class AddStatusToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :status, :integer
    # add_column :expenses, :status, 0 default should be 0 since its enum 
  end
end
