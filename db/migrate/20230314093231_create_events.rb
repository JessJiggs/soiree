class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :venue_name
      t.string :venue_address
      t.integer :est_guests
      t.float :total_budget

      t.timestamps
    end
  end
end
