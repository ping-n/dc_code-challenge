class Talk
  attr_accessor :talk_name, :start_time, :end_time, :speaker

  def initialize(name, start_time, end_time, speaker)
    @talk_name = name
    @start_time = start_time
    @end_time = end_time
    @speaker = speaker
  end
end