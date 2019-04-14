import 'package:flutter/material.dart';

widgets(params, style){
  
  var values = properties(style);

  final component = {
    'button': RaisedButton(
      onPressed: (){
        print(params[2]);
      },
      child: Text(params[1], style: style['text']),
      padding: values['padding'],
      color: values['color'],
      shape: values['shape'],
      elevation: values['elevation'],
      splashColor: values['splashColor'],
      highlightElevation: values['highlightElevation'],
      disabledElevation: values['disabledElevation'],
      colorBrightness: values['colorBrightness'],
    ),

  };
  
  return component[params[0]];
}

div(type, context){
  
  if(type[0]=='stack'){
    type.remove('stack');
    return Stack(children: <Widget>[
      ListView.builder(
        itemCount: type.length,
        itemBuilder: (context, index){
          return type[index];
        }
      )
    ],);
  }

  if(type[0]=='content'){
    type.remove('stack');
    return Container(
      child: type[1]
    );
  }
}


properties(style){
  var shape, color, padding, elevation, splashColor, highlightElevation, disabledElevation, colorBrightness;

  if(style.containsKey("color")) color = style['color'];
  if(style.containsKey("shape")) shape = style['shape'][0];
  if(style.containsKey("padding")) padding = style['padding'];
  if(style.containsKey("elevation")) elevation = style['elevation'];
  if(style.containsKey("splashColor")) splashColor = style['splashColor'];
  if(style.containsKey("highlightElevation")) highlightElevation = style['highlightElevation'];
  if(style.containsKey("disabledElevation")) disabledElevation = style['disabledElevation'];
  if(style.containsKey("colorBrightness")) colorBrightness = style['colorBrightness'];
  
  var values = {
    'color': color,
    'shape': shape,
    'padding': padding,
    'elevation': elevation,
    'splashColor': splashColor,
    'highlightElevation': highlightElevation,
    'disabledElevation': disabledElevation,
    'colorBrightness': colorBrightness,
  };

  return values;
}
// props(params, style){
//   final css = styleSheet(style);
//   return Text(params, style: css[0]);
// }

