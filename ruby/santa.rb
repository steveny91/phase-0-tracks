class Santa
  attr_reader :ethnicity
  attr_accessor :age, :gender

  def initialize (gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts " Ho ho ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end
  
  
  def celebrate_birthday
    @age += 1
  end
  
  def get_mad_at(reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking << reindeer
  end
  
  
  def about
    puts @gender
    puts @age
    p @reindeer_ranking
    puts @ethnicity
  end
end

tj = Santa.new("Male", "White")
tj.gender = "female"
p tj.get_mad_at("Rudolph")
p tj.celebrate_birthday
p tj.age = rand(1..140)
p tj.ethnicity



=begin

random santa generator
def santa_gen(int)
  santas = []
  example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
  example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
  int.times {
    random1 = rand(0..6)
    random2 = rand(0..6)
    santas << Santa.new(example_genders[random1], example_ethnicities[random2])
  }
  santas
end



santa_gen(6) 

  
=end
