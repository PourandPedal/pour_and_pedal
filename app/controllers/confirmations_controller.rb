class ConfirmationsController < ApplicationController

  expose(:confirmation) { Confirmation.find_by_confirmation_number(params[:code]) }

end
