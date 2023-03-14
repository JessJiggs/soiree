class CreateCollaborations < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
