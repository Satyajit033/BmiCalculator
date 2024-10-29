import 'package:flutter/material.dart';



InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder:  const OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.blueGrey, width: 2),
    ),
    border: const OutlineInputBorder(),
    labelText: label,
    labelStyle: const TextStyle(color:Colors.blueGrey),
  );
}


ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}


Ink SuccessButtonChild(Text text){
  return  Ink(
    decoration: BoxDecoration(color:Colors.blueGrey, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 56,
      alignment: Alignment.center,
      child: text,
    ),
  );
}