class TripsController < ApplicationController

  layout false



  expose(:trip)
  expose(:trips)

  def show
    if current_user && current_user.admin?
    else
      redirect_to root_path, notice: 'You must be logged in to see that page!'
    end
  end

  def index
    if current_user && current_user.admin?
    else
      redirect_to root_path, notice: 'You must be logged in to see that page!'
    end
  end

end
