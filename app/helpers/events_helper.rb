module EventsHelper

  def location_events(location)
    @events = Event.where(location_id: location.id)
  end
end