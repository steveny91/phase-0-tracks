/*
Psuedocode:
Method that takes in a string
Input = string
Output = string
  Take a string
  Take last letter of string and put it at the beginning of a new string(reverse string)
  Continue adding the last letter of string to the new string until there is no more letters in the input string
  Give the reverse string if conditions are met
  Else just give the original string
*/


function reverse_string(str){
  var rstr = "";
  for (var i = str.length - 1; i >= 0; i--) {
    rstr+= str[i];
  }
  if (str.length < 7){
    return rstr;
  } else {
    return str;
  }
}

console.log(reverse_string("hello"))
