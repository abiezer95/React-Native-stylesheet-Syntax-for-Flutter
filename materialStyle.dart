import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text, type;
  final style;
  final onPressed;
  final bool isExtended;
  final List child;
  
  Button({
    this.onPressed,
    this.child,
    this.text = '',
    this.type = '',
    this.style = '',
    this.isExtended = false
  }); 
  
  @override
  Widget build(BuildContext context){
    var all;

    (type == null || type == '' || type == 'button') ? all = 'button' : 
    (type == 'flat' || type == 'flatButton') ? all = 'flatButton' : 
    (type == 'float' || type == 'floatingActionButton') ? all = 'floatingActionButton' : all = '';

    return widgets([all, text, onPressed, isExtended, child], style, '', child);
  }
}

class Input extends StatelessWidget{
  final String name, type, placeholder, hintText;
  final autocorrect;
  final autofocus;
  final style;
  final onChange;
  
  Input({
    @required this.name,
    this.onChange = '',
    this.placeholder = '',
    this.type = '',
    this.style = '',
    this.hintText = '',
    this.autocorrect = false,
    this.autofocus = false
  }); 
  
  @override
  Widget build(BuildContext context){ 
    var all;
    (type == 'password') ? all = "password" : all = "input";

    return widgets([all, name, type, false], style, {"hintText": hintText, "autocorrect": autocorrect, "autofocus": autofocus, "onChange": onChange, 'placeholder': placeholder}, '');
  }
}

class Br extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10,);
  }
}

widgets(params, style, optionalInput, optional){
  String action = params[2]; 

  if(style == '' || style == null || style == false) style = {};
  if(optional == '' || optional == null || optional == false) optional = [];
  if(optionalInput == '' || optionalInput == null || optionalInput == false) optionalInput = {'autofocus': false, 'autocorrect': false};

  final component = {
    'button': RaisedButton(
      onPressed: (){
        print(action);
      },
      child: Text(params[1], style: style['text']),
      padding: style['padding'],
      color: style['background'],
      shape: style['shape'],
      elevation: style['elevation'],
      splashColor: style['splashColor'],
      highlightElevation: style['highlightElevation'],
      disabledElevation: style['disabledElevation'],
      colorBrightness: style['colorBrightness'],
      disabledColor: style['disabledColor'],
    ),
    'flatButton': FlatButton(
      onPressed: (){
        print(action);
      },
      child: Text(params[1], style: style['text']),
      padding: style['padding'],
      color: style['background'],
      shape: style['shape'],
      splashColor: style['splashColor'],
      colorBrightness: style['colorBrightness'],
      disabledColor: style['disabledColor'],
    ),
    'floatingActionButton': FloatingActionButton(
      onPressed: (){
        print(action);
      },
  
      isExtended: params[3],
      backgroundColor: style['background'],
      foregroundColor: style['foregroundColor'],
      shape: style['shape'],
      elevation: style['elevation'],
      highlightElevation: style['elevation'],
      disabledElevation: style['disabledElevation'],
      materialTapTargetSize: style['materialTapTargetSize'],
      child: Stack(children: <Widget>[
        // Text(params[1], style: style['text']),
        ListView.builder(
        itemCount: optional.length,
        itemBuilder: (context, index){
          return optional[index];
        },
      ),
      ],)
      
    ),
    'input': TextField(
      autocorrect: optionalInput['autocorrect'],
      autofocus: optionalInput['autocorrect'],
      style: style['text'],
      decoration: InputDecoration(
        hintText: optionalInput['hintText'],
        labelText: optionalInput['placeholder']
      ),
    ),
    'password': TextField(
      obscureText: true,
      autocorrect: optionalInput['autocorrect'],
      autofocus: optionalInput['autocorrect'],
      style: style['text'],
      decoration: InputDecoration(
        hintText: optionalInput['hintText'],
        labelText: optionalInput['placeholder']
      ),
    ),
  };
  
  return component[params[0]];
}

div(type, context){
  String what = type[0].toLowerCase();
  
  if(what=='stack'){
    type.remove(what);
    return Stack(children: <Widget>[
      ListView.builder(
        itemCount: type.length,
        itemBuilder: (context, index){
          return type[index];
        }
      )
    ],);
  }

  if(what=='container'){
    return Container(
      child: type[1]
    );
  }
  
  if(what=='content'){
    type.remove('content');
    return ListView.builder(
          itemCount: type.length,
          itemBuilder: (context, index){
            return type[index];
          }
        );
  }
}

