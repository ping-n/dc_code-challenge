class Helper
  def check_timeslot(talks, talk)
    talks.each do |x| 
      x.end_time.include?(talk.end_time)
    end
  end
end