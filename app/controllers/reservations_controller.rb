class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :admin_owner_only, except: [:show, :index, :new]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    #@reservations = current_user.reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    # @reservation = Reservation.new(reservation_params)
    @reservation = current_user.reservations.create!(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
    # current_user.book! @reservation
  end

  def make_reservation
    # @restaurant.bookings.delete_all
    # @restaurant.schedule = IceCube::Schedule.new(Date.today, duration: 1.day)
    # @restaurant.schedule.add_recurrence_rule IceCube::Rule.weekly.day(:friday,:saturday,:sunday)
    # @restaurant.save!
    # from_ok = Date.today.next_week + 4.days
    # to_ok = from_ok + 2.days
    # current_user.book! @restaurant, time_start: from_ok, time_end: to_ok, amount: 1
  end


  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :restaurant_id, :time, :date, :head_count,
                                          :special_request, :cancel)
    end
end
