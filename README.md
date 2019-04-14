# React-Native-stylesheet-Syntax-for-Flutter

Components added for style css syntax like react native;

<ul>
  <li>Raise Button</li>
  <li>stack</li>
  <li>continer</li>
</ul>

<h1>USAGE: </h1>

import the file into the main.dart or another file you want to use

You can use them like react natiave example: 

div('stack', [
  //content
], context)

div('Container', [
  //content
], contex)

<h4>for components:</h4>
use ID, text (Required), and actions (not required) for components 

<b>widgets(['button', 'Text Name', Action()], css('ID NAME'));</b>

Be sure add this into the return or containers;

<h1>for style:</h1>

Use the funtion you want here, in this case we will use css function:

css(style){
  var sheet = {
    'ID NAME': {
      'color': Colors.white 
    }
  }
  return sheet[style];
}
