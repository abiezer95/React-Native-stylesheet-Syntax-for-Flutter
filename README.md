# Stylesheet-Syntax-for-Flutter

Components added for style css syntax like react native;

<ul>
  <li>Raise Button</li>
  <li>stack</li>
  <li>container</li>
</ul>

<h1>USAGE: </h1>

import the file into the main.dart or another file you want to use

You can use them like react natiave example: 

div('stack', [<br>
  //content<br>
], context)<br>

div('Container', [<br>
  //content<br>
], contex)<br>

<h4>for components:</h4>
use ID, text (Required), and actions (not required) for components 

<b>widgets(['button', 'Text Name', Action()], css('ID NAME'));</b>

Be sure add this into the return or containers;

<h1>for style:</h1>

Use the funtion you want here, in this case we will use css function:

css(style){<br>
  var sheet = {<br>
    ////'ID NAME': {<br>
      ////'color': Colors.white <br>
   //// }<br>
  }<br>
  return sheet[style];<br>
}

<br>
Image Examples:

![image](https://user-images.githubusercontent.com/9676420/56097531-88e73c00-5ec3-11e9-96a4-97038eea68ea.png)
![image (1)](https://user-images.githubusercontent.com/9676420/56097538-9e5c6600-5ec3-11e9-801d-c8b6826a035c.png)
![image (2)](https://user-images.githubusercontent.com/9676420/56097539-a0262980-5ec3-11e9-99d6-2ecf790bb817.png)

<h1>Help us to inprove this material syntax to get the best of flutter :) </h1>
