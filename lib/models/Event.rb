require_relative "../helper/Helper.rb"

class Event
  attr_accessor :event_name, :talks

  def initialize(name)
    @event_name = name
    @talks = []
    @helper = Helper.new
  end

  def add_event(talk)
    if @helper.check_timeslot(@talks, talk)
      puts "The time slot #{talk.start_time} to #{talk.end_time} is already filled."
      puts "Please choose a different time slot."
    else
      @talks.push(talk)
      puts "#{talk.talk_name} was added successfully."
    end
  end
end