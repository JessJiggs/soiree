class AddSongsToPlaylist < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :songs, :string
  end
end
