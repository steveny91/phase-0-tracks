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
This nested method works, because of the input matches what the second method takes as in input. for example decrypt(encrypt("swordfish")) encrypt returns a string that can be inputted into decrypt.

psuedocode
#Encrypt
#  Get string first
#  get the first letter
#  advance by one
#  get next letter and advance by one(repeat)
# = when last letter is advanced by one
# = combine and output the word

# decrypt
# get first letter
# find index of letter
# subtract by one to get new letter
# repeats process till last letter
# combine and output the word

# ask Secret agent for Encrypt or decrypt choice
# if encryp run encrypt
#    else if decrypt run decryp
# one encrypt or decrypt run, output and exit
=end