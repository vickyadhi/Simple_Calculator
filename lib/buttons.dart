import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;

  MyButton({this.color,this.textcolor,this.buttonText, this.buttonTapped});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped ,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 17.3),),
            ),
          ),
        ),
      ),
    );
  }
}
