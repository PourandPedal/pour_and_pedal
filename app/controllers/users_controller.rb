class UsersController < ApplicationController

  expose(:user)

  def create
    if user.save
      redirect_to user, notice: "Signed up!"
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to user, notice: "Updated"
    else
      render :edit
    end
  end

end
