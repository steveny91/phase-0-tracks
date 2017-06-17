//release 1 add an li element into the ul
var elements = document.getElementsByTagName("ul")
var element = elements[0]
var list = document.createElement("li");
var text = document.createTextNode("This a newly inserted text");

list.appendChild(text);
element.appendChild(list);


//release 2 event listeners for buttons
var buttons = document.getElementsByTagName("button");
var button = buttons[0]

function button1(){
  alert( "You clicked on the button");
}
function button2(){
  alert ("Don't do it!");
}

button.addEventListener("click", button1)
buttons[1].addEventListener("mouseover", button2)
