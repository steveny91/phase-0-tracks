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
