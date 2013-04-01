class ContactsController < ApplicationController

  expose(:contact)

  def create
    if contact.save
      redirect_to events_path, notice: 'message sent. how about browsing some of our great events!'
      NotificationMailer.new_contact(contact).deliver
    else
      render :new
    end
  end
end
