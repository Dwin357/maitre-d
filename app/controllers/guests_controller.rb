class GuestsController < ApplicationController
  def index
    set_var_for_index
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
    set_var_for_index
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

  def load
    parser = CsvParser.new
    parser.parse_guests(file_params)
    @errors = parser.errors
    set_var_for_index
    render "index"
  end

  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id, :image)
    end

    def file_params
      params.require(:guest).permit(:file)
    end

    def set_var_for_index
      @event = current_event
      @guests = current_event.guests.order(:last_name)
      @guest = Guest.new
    end
end