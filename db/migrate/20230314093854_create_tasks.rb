class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :due_date
      t.boolean :status
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
