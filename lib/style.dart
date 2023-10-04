import 'package:flutter/material.dart';

InputDecoration appTextField (text) {
  return InputDecoration (enabledBorder:
  const OutlineInputBorder()
  ,
  labelText: text
  );
}