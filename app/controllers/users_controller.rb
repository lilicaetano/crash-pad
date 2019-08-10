class UsersController < ApplicationController
  def bookings
    @bookings = Booking.where(current_user == :user)
  end
end
