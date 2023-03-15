class ChangeBoolToEnum < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :rsvp_status
    remove_column :guests, :invite_status
    add_column :guests, :invitation_status, :integer, default: 0

    change_column :tasks, :status, 'integer USING CAST(status AS integer)'
  end

end
