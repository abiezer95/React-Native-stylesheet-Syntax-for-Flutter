import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text, type;
  final style;
  final onPressed;
  
  Button({
    @required this.text,
    this.onPressed,
    this.type = '',
    this.style = ''
  }); 
  
  @override
  Widget build(BuildContext context){
    var all;
    if(type == null || type == '') all = widgets(['button', text, onPressed], style, '');
    if(type == 'flatButton' || type == 'flat') all = widgets(['flatButton', text, onPressed], style, '');
    return all;
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
    if(type == 'password') return widgets(['password', name, type], style, {"hintText": hintText, "autocorrect": autocorrect, "autofocus": autofocus, "onChange": onChange});
    
    else return widgets(['input', name, type], style, {"hintText": hintText, "autocorrect": autocorrect, "autofocus": autofocus, "onChange": onChange, 'placeholder': placeholder});
  }
}

class Br extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10,);
  }
}

widgets(params, style, optional){
  String action; 

  if(style == '' || style == null || style == false) style = {};
  if(optional == '' || optional == null || optional == false) optional = {'autofocus': false, 'autocorrect': false};
  
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
    'input': TextField(
      autocorrect: optional['autocorrect'],
      autofocus: optional['autocorrect'],
      style: style['text'],
      decoration: InputDecoration(
        hintText: optional['hintText'],
        labelText: optional['placeholder']
      ),
    ),
    'password': TextField(
      obscureText: true,
      autocorrect: optional['autocorrect'],
      autofocus: optional['autocorrect'],
      style: style['text'],
      decoration: InputDecoration(
        hintText: optional['hintText'],
        labelText: optional['placeholder']
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

