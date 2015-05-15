class EventAttendingsController < ApplicationController
  def new
  end

  def create
	  @attending = current_user.event_attendings.build(attend_params)
	  if @attending.save
	  	redirect_to event_path(params[:event_attending][:attended_event_id])
	  else
	  	redirect_to event_path(params[:event_attending][:attended_event_id])
	  end
	end

    def destroy
  	  current_user.event_attendings.find_by(attended_event_id: params[:id]).destroy
  	  redirect_to :back
  	end


	private 

	def attend_params
	  params.require(:event_attending).permit(:attended_event_id)
    end
end
