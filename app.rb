require_relative "./lib/models/Event.rb"
require_relative "./lib/models/Speaker.rb"
require_relative "./lib/models/Talk.rb"

event = Event.new("My event")
speaker = Speaker.new("John")

talk = Talk.new("Joint", "9:00am", "10:00am", speaker)

pp talk