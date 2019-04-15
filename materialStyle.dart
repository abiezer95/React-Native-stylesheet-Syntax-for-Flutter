import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text;
  final String type;
  final id;
  final onPressed;
  
  Button({
    @required this.text,
    this.onPressed,
    this.type = '',
    this.id = ''
  }); 
  
  @override
  Widget build(BuildContext context){
    var all;
    if(type == null || type == '') all = widgets(['button', text, onPressed], id);
    if(type == 'flatButton' || type == 'flat') all = widgets(['flatButton', text, onPressed], id);
    return all;
  }
}

class Input extends StatelessWidget{
  final String name;
  final String type;
  final String placeholder;
  final String label;
  final id;
  final onChange;
  
  
  Input({
    @required this.name,
    this.onChange = '',
    this.placeholder = '',
    this.type = '',
    this.id = '',
    this.label = ''
  }); 
  
  @override
  Widget build(BuildContext context){ 
    if(type == 'password') return widgets(['password', name, onChange, type, label], id);
    else return widgets(['input', name, onChange, type, label], id);
  }
}

widgets(params, style){
  String action; 
  String placeholder; 
  String label; 

  if(style == '' || style == null || style == false) style = {};

  // if(params.length==3){
  //   placeholder = params[3];
  //   label = params[4];
  // } 
  
  if(style['autofocus']==null) style['autofocus'] = false;
  if(style['autocorrect']==null) style['autocorrect'] = false;

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
      autocorrect: style['autocorrect'],
      autofocus: style['autofocus'],
      style: style['text'],
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: label
      ),
    ),
    'password': ''
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

  if(type[0]=='container'){
    return Container(
      child: type[1]
    );
  }
  
  if(type[0]=='content'){
    type.remove('content');
    return ListView.builder(
          itemCount: type.length,
          itemBuilder: (context, index){
            return type[index];
          }
        );
  }

}

