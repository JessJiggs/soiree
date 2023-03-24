class PlaylistController < ApplicationController
  before_action :note_params, only: [:create]

  def create
    @playlist = Playlist.new(note_params)
    # @note.event = current_user
    if @paylist.save
      # redirect_to root_path, :notice => "Successfully created note."
    else
      # redirect_to root_path, status: :unprocessable_entity, notice: "Note was not created."
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:songs)
  end
end
