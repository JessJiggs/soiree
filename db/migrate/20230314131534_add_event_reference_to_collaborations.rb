class AddEventReferenceToCollaborations < ActiveRecord::Migration[7.0]
  def change
    add_reference :collaborations, :event, null: false, foreign_key: true
  end
end
