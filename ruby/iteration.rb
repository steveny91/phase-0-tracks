#RELEASE 0
def dbc_pair
  puts "this is pairing 5.3"
  yield("Hannie","Steven")
  puts "hope this works!"
end

=begin  
def dbc_pair
  name1= gets.chomp
  name2= gets.chomp
  puts "this is pairing 5.3"
  yield(name1,name2)
  puts "hope this works!"
end
=end


dbc_pair {|name1, name2| puts "done by #{name1} and #{name2}"}

#RELEASE 1
myarray = ["apples", "oranges", "pear", "bananas"]

myhash = {
  fruit: "apples",
  meat: "steak",
  drink: "water",
  dessert: "ice cream"
}

myarray.each {|fruit| puts "We need to buy #{fruit}"}

###
#lenght = myarray.length
#lenght.times {|x| puts myarray[x]}
###

myhash.each {|cat, item| puts "for #{cat} we'll buy #{item}"}


myarray.map! do |fruit|
  puts fruit
  "10" + " #{fruit}" 
end

#RELEASE 2
array1 = (1..26).to_a 

hash1 = {
  "a"=> 1,
  "b"=> 2,
  "c"=> 3,
  "d"=> 4,
  "e"=> 5,
  "f"=> 6,
  "g"=> 7,
  "h"=> 8,
  "i"=> 9,
  "j"=> 10
}

p array1.delete_if {|x| x<5}
puts hash1.delete_if {|k, v| v <5}

p array1.keep_if {|x| x <= 5}
p hash1.keep_if {|k, v| v < 5}

p array1.select {|x| x <= 5}
p hash1.select {|k, v| v < 5}

p array1.reject {|x| x <= 5}
p hash1.reject {|k, v| v < 5}










