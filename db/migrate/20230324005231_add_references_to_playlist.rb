class AddReferencesToPlaylist < ActiveRecord::Migration[7.0]
  def change
    add_reference :playlists, :event, null: false, foreign_key: true
  end
end
