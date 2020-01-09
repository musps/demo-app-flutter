import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String text;
  final Function onPressed;

  ButtonWidget({this.textColor, this.color, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Text(text, style: new TextStyle(fontSize: 18)),
      height: 46,
      color: color,
      textColor: textColor,
    );
  }
}
