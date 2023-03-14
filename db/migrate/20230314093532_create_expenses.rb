class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.float :amount_spent

      t.timestamps
    end
  end
end
