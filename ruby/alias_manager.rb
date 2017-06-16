def indexlookup(group, letter)
  group.index(letter)
end  

vowels = "aeioua"
consonant = "bcdfghjklmnpqrstvwxyzb"

def encrypter (letter)
  vowels = "aeioua"
  consonant = "bcdfghjklmnpqrstvwxyzb"
  if vowels.include? letter
    letter = vowels[indexlookup(vowels, letter)+1]  
  elsif consonant.include? letter
    letter = consonant[indexlookup(consonant, letter)+1]
  end
end

def nameinput
  puts "what is your name"
  oldname = gets.chomp.split(' ').reverse
  spy = oldname.map {|name| name.split('')}
end

 
def namechanger(spy)
spy.each {|array| array.map! {|letter| encrypter(letter)}}
spy.map! {|array| array.join('').capitalize}
return spy.join(" ")
end

def allinone
  list_alias={}
  repeat = TRUE
  until repeat == FALSE do
    puts "what is your name (type quit to stop)"
    inputname = gets.chomp
    if inputname == "quit"
      repeat = FALSE
    else
      oldname = inputname.downcase.split(' ').reverse
      spy = oldname.map {|name| name.split('')}
      new_name = namechanger(spy)
      list_alias[inputname] = new_name
      repeat = TRUE
    end
  end
  list_alias.each {|k,v| puts "I'm #{v} A.K.A #{k}"}
end

allinone