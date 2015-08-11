class EventsController < ApplicationController

	def index
		@events = Event.all
    if request.xhr?
      render json: @events
    end
	end

  def show
    @user = current_user
    @event = @user.events.where(id: params[:id])[0]
    puts @event
    puts @event.tables[0].guests.map(&:first_name)
    update_current_event(@event)
    @guests = @event.guests
    @guest_list = @guests.map(&:last_name)
    p "********"
    p @guest_list
    @num_of_tables = @event.tables.length
    @number_of_seats = @event.tables[0].number_of_seats
    @tables = seat_guests(@event.tables, @guests)

    if request.xhr?
      render json: {tables: @tables, guests: @tables.guests}
    end
  end

  def new
  	@event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)
    @number = 1
    params[:event][:table][:number].to_i.times do
      p params
      Table.create!(number_of_seats: params[:event][:table][:number_of_seats], number: @number, event: @event)
      @number +=1
    end
    if @event.save
      if request.xhr?
        render json: @event
      else
        redirect_to @event
      end
    else
      render :new
    end

  end


  private
  def event_params
    params.require(:event).permit(:name, :zip_code, :state, :address_line_one, :address_line_two, :begins_at, :ends_at)
  end

end
