class Event
  attr_accessor :event_name, :talks

  def initialize(name)
    @event_name = name
    @talks = []
  end

  #Adding new talk to the event
  def add_talks(talk)
    end_time = @talks.map { |talk| talk.end_time}

    # Check if end_time already exist
    if end_time.include?(talk.end_time) 
      puts "Time slot already filled."
      puts "Please enter a different time frame"
    else
      @talks << talk
    end
  end
end