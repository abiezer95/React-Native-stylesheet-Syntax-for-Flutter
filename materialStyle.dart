import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text, type, tooltip;
  final bool isExtended;
  final bool mini;
  final style;
  final icon;
  final onPressed;
  
  Button({
    this.mini = false,
    this.isExtended = false,
    this.onPressed,
    this.text = "",
    this.type = "",
    this.style = "",
    this.icon = "",
    this.tooltip = "",
    
  }); 
  
  @override
  Widget build(BuildContext context){
    var all;

    (type == null || type == '' || type == 'button') ? all = 'button' : 
    (type == 'flat' || type == 'flatButton') ? all = 'flatButton' : 
    (type == 'float' || type == 'floatingActionButton') ? all = 'floatingActionButton' : 
    (type == 'IconButton' || type == 'iconbutton' || type == 'iconButton') ? all = 'IconButton' : all = '';

    return widgets([all, text, onPressed, isExtended, mini, icon, tooltip], style, '');
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

    return widgets(
        [all, name, type, false, false, '', ''], style, 
        {"hintText": hintText, "autocorrect": autocorrect, "autofocus": autofocus, "onChange": onChange, 'placeholder': placeholder}
    );
  }
}

class Br extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10,);
  }
}

widgets(params, style, optionalInput){
  String action = params[2];

  if(style == '' || style == null || style == false) style = {};
  if(optionalInput == '' || optionalInput == null || optionalInput == false) optionalInput = {'autofocus': false, 'autocorrect': false};
  if(params[5] == '' || params[5] == null || params[5] == false) params[5] = Icons.home;

  print(params);
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
      child: Text(params[1], style: style['text']),
      mini: params[4],
      tooltip: params[6],
    ),
    'IconButton': IconButton(
        onPressed: () {
          print(action);
        },
        icon: Icon(params[5]),
        tooltip: params[6],
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

