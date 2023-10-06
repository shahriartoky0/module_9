import 'package:flutter/material.dart';

InputDecoration appTextField (text) {
  return InputDecoration (enabledBorder:
  const OutlineInputBorder()
  ,
  labelText: text
  );
}
ButtonStyle appInputButtonStyle (){
  return TextButton.styleFrom(elevation:8,backgroundColor: Colors.white,foregroundColor: Colors.grey,shape:CircleBorder(
     ));
}