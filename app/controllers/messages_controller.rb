class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    if @message.save
      EventChannel.broadcast_to(
        @event,
        render_to_string(partial: "message", locals: { message: @message })
      )
       head :ok

    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @message = Message.new
    @messages = @event.messages
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
