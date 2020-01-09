import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final String title = 'Calculator';

  CalculatorScreen({Key key}) : super(key: key);
  _CalculatorScreen createState() => _CalculatorScreen();
}

enum ButtonColor {
  grey,
  darkgrey,
  orange
}

class PadActions {
  static String clear = 'A/C';
  static String r2 = 'A/C';
  static String r3 = 'A/C';
}

class _CalculatorScreen extends State<CalculatorScreen> {
  String screenText = '0';

  void actionClear() {
    setState(() {
      screenText = '0';
    });
  }

  void actionConcate(String value) {
    setState(() {
      screenText += value;
    });
  }

  Expanded _button(String text, int flex, double padding, [ButtonColor bgColor, Color textColor = Colors.white]) {
    var buttonBg;
    switch (bgColor) {
      case ButtonColor.grey:
        buttonBg = Color(0xffa5a5a5);
        break;
      case ButtonColor.darkgrey:
        buttonBg = Color(0xff323232);
        break;
      case ButtonColor.orange:
        buttonBg = Color(0xfffa9f08);
        break;
      default:
        buttonBg = Color(0xff323232);
        break;
    }

    var buttonView = FlatButton(
      onPressed: () => actionConcate(text),
      color: buttonBg,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 30.0
        )
      ),
    );

    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(padding),
        height: 100,
        child: buttonView,
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    print(0.55 / 100);
    var screen = Expanded(flex: 1, child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: FittedBox(child: Text(
          screenText,
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
          )
        ))
      )
    ));

    var pad = Expanded(
      flex: 2, 
      child: Container(
        child: Column(
          children: [
            Row(children: [
              _button(PadActions.clear, 1, 8, ButtonColor.grey, Colors.black),
              _button('+/-', 1, 8, ButtonColor.grey, Colors.black),
              _button('%', 1, 8, ButtonColor.grey, Colors.black),
              _button('\u00F7', 1, 8, ButtonColor.orange),
            ]),
            Row(children: [
              _button('7', 1, 8),
              _button('8', 1, 8),
              _button('9', 1, 8),
              _button('x', 1, 8, ButtonColor.orange),
            ]),
            Row(children: [
              _button('4', 1, 8),
              _button('5', 1, 8),
              _button('6', 1, 8),
              _button('-', 1, 8, ButtonColor.orange),
            ]),
            Row(children: [
              _button('1', 1, 8),
              _button('2', 1, 8),
              _button('3', 1, 8),
              _button('=', 1, 8, ButtonColor.orange),
            ]),
            Row(children: [
              _button('0', 2, 8),
              _button(',', 1, 8),
              _button('=', 1, 8, ButtonColor.orange),
            ]),
            Row(children: [])
          ]
        )
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            screen,
            pad,
          ]
        )
      )
    );
  }
}
