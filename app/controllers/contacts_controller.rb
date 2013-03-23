class ContactsController < ApplicationController

  expose(:contact)

  def create
    if contact.save
      redirect_to events_path, notice: 'message sent. how about browsing some of our great trips!'
    else
      render :new
    end
  end
end
