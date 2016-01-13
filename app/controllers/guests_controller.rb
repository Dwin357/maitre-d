class GuestsController < ApplicationController
  def index
    @event = current_event
    @guests = current_event.guests.order(:last_name)
    @guest = Guest.new
    if request.xhr?
      render json: @guests
    end
  end

  def show
    if request.xhr?
      render json: Guest.find_by_id(params[:id])
    end
  end

  def create
    guest = Guest.create!(guest_params)
    event = guest.event
    if request.xhr?
      render json: guest
    else
      redirect_to guests_path
    end
  end

  def edit
    @event = current_event
    @guests = current_event.guests.order(:last_name)
    @guest = Guest.find_by_id(params[:id])
    @edit = true
    render "index"
  end

  def update
    guest = Guest.find_by_id(params[:id])
    guest.attributes = guest_params
    guest.save
    
    if request.xhr?
      render json: guest
    else
      redirect_to guests_path
    end
  end

  def destroy
    guest = Guest.find_by_id(params[:id])
    guest.destroy

    if request.xhr?
      render nothing: true
    else
      redirect_to guests_path
    end
  end

  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id, :image)
    end
end