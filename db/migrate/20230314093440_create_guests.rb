class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.references :event, null: false, foreign_key: true
      t.string :fist_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.boolean :invite_status
      t.boolean :rsvp_status

      t.timestamps
    end
  end
end
