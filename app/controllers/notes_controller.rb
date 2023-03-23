class NotesController < ApplicationController
  before_action :note_params, only: [:create]


  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path, :notice => "Successfully created note."
    else
      redirect_to root_path, status: :unprocessable_entity, notice: "Note was not created."
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
