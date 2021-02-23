require_relative "../models/Event.rb"
require_relative "../models/Talk.rb"
require_relative "../models/Speaker.rb"

class Menu
  def initialize
    @events = []
    @speakers = []
  end

  def run(commands)
    case
    when commands[0] == "CREATE"
      choice(commands)
    when commands[0] == "PRINT"
      event_name = commands[2]

      if @events.length == 0
        puts "No event found"
      else 
        pp @events
      end
    else 
      puts "Invalid command"
    end
  end

  def list_events(event_name)

  end

  def check_speaker(speaker)
    speakers = @speakers.map {|speaker| speaker.speaker_name}
    speakers.include?(speaker) ? speaker : Speaker.new(speaker)
  end

  def choice(commands)
    case
    when commands[1] == "EVENT"
      @events.push(Event.new(commands[2]))
      puts "You have successfully created a new Event."
    when commands[1] == "SPEAKER"
      @speakers.push(Speaker.new(commands[2]))
      puts "You have successfully added a new Speaker."
    when commands[1] == "TALK"
      @events.each do |event|
        if event.event_name == commands[2]
          event.add_talks(Talk.new(commands[3], commands[4], commands[5], check_speaker(commands[6])))
        end
      end
    end
  end
end