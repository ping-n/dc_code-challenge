class Event
  attr_accessor :event_name, :talks

  def initialize(name)
    @event_name = name
    @talks = []
  end

  def add_event(talk)
    @talks.push(talk)
  end
end