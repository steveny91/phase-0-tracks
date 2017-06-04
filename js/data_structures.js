var horse = ["Anchovies", "Baba", "Crayon", "Dude"];
var color = ["Amber", "Blue", "Cyan", "Dandelion"];

horse.push("Eggy")
color.push("Ecru")



var horse_color = {};
for (var i = 0; i < color.length; i++){
  horse_color[horse[i]] = color[i]
}

console.log(horse_color)

