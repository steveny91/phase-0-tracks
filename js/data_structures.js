var horse = ["Anchovies", "Baba", "Crayon", "Dude"];
var color = ["Amber", "Blue", "Cyan", "Dandelion"];

horse.push("Eggy")
color.push("Ecru")



var horse_color = {};
for (var i = 0; i < color.length; i++){
  horse_color[horse[i]] = color[i]
}

console.log(horse_color)

function car_assembly(color, type, spare_needed){
  this.color = color;
  this.type = type;
  this.spare_needed = spare_needed
  this.ignition = function () {console.log("vroom vroom vroom")};
  console.log("generating a new "+color+ " " + type + " with "+ spare_needed + " spare parts")
}

var first_car = new car_assembly("blue", "sedan", 4);
console.log(first_car)
first_car.ignition()

