class ConfirmationsController < ApplicationController

  def show
    @confirmation = Confirmation.find_by_confirmation_number(params[:code])
  end
end
