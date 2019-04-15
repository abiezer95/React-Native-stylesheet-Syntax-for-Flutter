import 'package:flutter/material.dart';

widgets(params, style){
  if(style == ''){
    style = {};
  }
  final component = {
    'button': RaisedButton(
      onPressed: (){
        print(params[2]);
      },
      child: Text(params[1], style: style['text']),
      padding: style['padding'],
      color: style['color'],
      shape: style['shape'],
      elevation: style['elevation'],
      splashColor: style['splashColor'],
      highlightElevation: style['highlightElevation'],
      disabledElevation: style['disabledElevation'],
      colorBrightness: style['colorBrightness'],
      disabledColor: style['disabledColor'],
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

