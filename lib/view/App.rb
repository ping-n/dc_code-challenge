require_relative "../controller/Menu.rb"

class App
  def initialize
    @menu = Menu.new
  end

  def start
    loop do
      puts "Welcome to Mad Events"
      puts "***" * 10
      case user_choice
      when 1
        puts "Create new event by inputting: CREATE EVENT NAME"
        commands = gets.chomp.split(" ")
        @menu.run(commands)
      when 2
        puts "Create new event by inputting: CREATE SPEAKER NAME"
        commands = gets.chomp.split(" ")
        @menu.run(commands)
      when 3
        puts "Create new event by inputting: CREATE TALK EVENT_NAME TALK_NAME START_TIME END_TIME SPEAKER_NAME"
        commands = gets.chomp.split(" ")
        @menu.run(commands)
      when 4
        puts "Print all talks for an event: PRINT TALKS EVENT_NAME"
        commands = gets.chomp.split(" ")
        @menu.run(commands)
      when 5
        puts "Thank you for using Mad Events"
        exit
      else
        puts "Invalid option"
      end
    end
  end

  # Getting user choice
  def user_choice
    puts "Please input from the following options:"
    puts "1: Create new event"
    puts "2: Create new speaker"
    puts "3: Create new talk"
    puts "4: View all Talks for an Event"
    puts "5: Exit"

    choice = gets.chomp.to_i
  end
end