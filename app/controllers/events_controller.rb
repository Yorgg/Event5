class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id]) 
  end

  def new
  	@event = Event.new
  end

  def create
  	@new_event = current_user.created_events.build(event_params)
  	if @new_event.save
  	  redirect_to user_path(current_user.id)
  	else
  	  @event = @new_event
  	  render 'new'
  	end
  end

  private

  def event_params
    params.require(:event).permit(:title,:body,:address,:starts_at,:time)
  end
end
