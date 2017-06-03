/*
Pseudocode
Function to select longest phrase in an array of strings
input: array of strings
output: longest phrase in an array
  Take an array of strings
  Start with the first word and compare it with the second word
  The longer word will be kept
  Then compare the longer word with next word in the array and keep the longer word
  repeat until whole array has been checked.
*/


var string_array = ["long phrase","longest phrase","123asdgqwetqwerqwer","longer phrase"]


function longest_word(string){
  var longest = '' ;
  for (var i = 0; i < string.length; i++) {
    if(string[i].length > longest.length){
      longest = string[i];
    }
  }
  return longest
}

longest_word(string_array)


/*
Pseudocode
Function to compare the key:value pairs of each hash to find if they're identical or not
input : 2 hashes
output: True or false depending if there's any matches
  Take two hashes
  Compare the values of each hash same key
  If value of the same key is the same then there is a match
  If the value is not true then proceed to next key and compare
  If no key value pair matches then return false
*/


function key_pair(hash1 , hash2){
  var match = false
  for (var k in hash1) {
    if(hash1[k] == hash2[k]){
      match = true;
    }
  }
  return match
}


console.log(key_pair({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}))
console.log(key_pair({name: "Steven", age: 54}, {name: "Tamir", age: 54}))
console.log(key_pair({animal: "Do", legs: 4}, {animal: "Dog", legs: 3}))


/*
Pseudocode
Function to return an array with n length with phrases of varying length of 1 to 10
Input: integer
output: array with length of input
  Take an integer
  Generate a random number (n)
  Generate a word with n length
  Put word into an empty array
  Repeat until the array has a length of the desire integer
  Once array is generated, feed array into find longest word function
*/

function random_array(length){
  var array = [];
  for (var i = 0; i < length; i++){
    var int = Math.floor(Math.random()*9 + 1);
    var str = '';
    var alphabet = "abcdefghijklmnopqrstuvwxyz";
    for (var x = 0; x < int; x++){
      var randalpha = Math.floor(Math.random()*26);
      str += alphabet[randalpha];
    }
    array.push(str)
  }
  return array
}

var z = random_array(10)
console.log(z)
console.log(longest_word(z))