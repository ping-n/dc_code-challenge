require_relative "../models/Event.rb"
require_relative "../models/Talk.rb"
require_relative "../models/Speaker.rb"

class Menu
  def initialize
    @events = []
    @speakers = []
  end

  # Run the menu
  def run(commands)
    case
    when commands[0] == "CREATE"
      choice(commands)
    when commands[0] == "PRINT"
      event_name = commands[2]
      list_events(event_name)
    else 
      puts "Invalid command"
    end
  end


  # Menu choice base on use commands
  def choice(commands)
    case
    when commands[1] == "EVENT"
      @events.push(Event.new(commands[2].split("_").join(" ")))
      puts "You have successfully created a new Event."
    when commands[1] == "SPEAKER"
      @speakers.push(Speaker.new(commands[2]))
      puts "You have successfully added a new Speaker."
    when commands[1] == "TALK"
      @events.each do |event|
        # Add talks to the correct event
        if event.event_name == commands[2]
          event.add_talks(Talk.new(commands[3].split("_").join(" "), commands[4], commands[5], check_speaker(commands[6])))
        end
      end
    end
  end

  # List all talks for specific event
  def list_events(event_name)
    # Select event base on event name passed by user
    select_event = @events.select { |event| event.event_name == event_name}
    # Map the event and display all talks for that event in a readable format
    talks = select_event.map {|e| e.talks}
    talks.each do |talk|
      # Sort the talks by start time
      talk.sort_by! { |s| s.start_time.to_i}
      # iterate through talks and format according to brief
      talk.each do |x|
        puts "#{x.start_time} - #{x.end_time}"
        puts "  #{x.talk_name} presented by #{x.speaker.speaker_name}"
      end
      puts "***" * 10
    end
  end

  # Check if speaker exist, if not then create new speaker
  def check_speaker(speaker)
    speakers = @speakers.map {|speaker| speaker.speaker_name}
    speakers.include?(speaker) ? speaker : Speaker.new(speaker)
  end
end