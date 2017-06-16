=begin
module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + " .OHH YEAH!!"
  end
end
=end

module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + " .OHH YEAH!!"
  end
end


class Driver
  include Shout
end

class Teacher
  include Shout
end

driver1 = Driver.new
teacher1 = Teacher.new


p driver1.yell_angrily("WHY IS THERE TRAFFIC")
p driver1.yell_happily("no traffic")
p teacher1.yell_angrily("QUIET DOWN")
p teacher1.yell_happily("You all pass")