class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    # authorize @booking
    @booking.flat = Flat.find(params[:flat_id])
    @booking.user = user_signed_in? ? current_user : User.new
    if @booking.save!
      authorize @booking
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end
end
