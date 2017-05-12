def encrypt (str1)
  counter1 = 0 
  output1 = ""
  length1 = str1.length
  while counter1 < length1
  if str1[counter1] == "z"
      output1 += "a"
  else
    output1 += str1[counter1].next
  end
    counter1 += 1
  end
  return output1
end


def decrypt (str)
  counter = 0 
  output = ""
  length = str.length
  abc = "abcdefghijklmnopqrstuvwxyz"
  while counter < length
    searchindex = abc.index(str[counter])-1
    output +=abc[searchindex]
    counter +=1
  end
  return output
end


puts "Would you want to ask to encrypt or decrypt?"
choice =gets.chomp
puts "enter a password"
pass = gets.chomp


if choice == "encrypt"
  encrypt(pass)
elsif choice == "decrypt"
  decrypt(pass)
else
  puts "Wrong selection"
end




=begin
decrypt(encrypt("swordfish"))

=end