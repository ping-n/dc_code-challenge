require_relative "./lib/models/Event.rb"
require_relative "./lib/models/Speaker.rb"
require_relative "./lib/models/Talk.rb"

event = Event.new("My event")
john = Speaker.new("John")
james = Speaker.new("James")

talk1 = Talk.new("Js Worlds", "9:00am", "11:00am", john)
talk2 = Talk.new("Ruby World", "10:00am", "11:00am", james)

event.add_event(talk1)
event.add_event(talk2)

pp event