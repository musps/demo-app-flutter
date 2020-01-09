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
  static String direction = '+/-';
  static String percentage = '%';
  static String divisor = '\u00F7';
  static String multiply = 'x';
  static String subtract = '-';
  static String add = '+';
  static String equals = '=';
}

class PadValues {
  static String decimal = ',';
  static String zero = '0';
  static String one = '1';
  static String two = '2';
  static String three = '3';
  static String four = '4';
  static String five = '5';
  static String six = '6';
  static String seven = '7';
  static String eight = '8';
  static String nine = '9';
}

class _CalculatorScreen extends State<CalculatorScreen> {
  String screenText = '';

  void actionConcate(String value) {
    setState(() {
      screenText += value;
    });
  }

  _buttonAction({String text, int flex, double padding, ButtonColor bgColor, Color textColor = Colors.white}) {
    var action = () {
      setState(() {
        screenText = '';
      });
    };
    return _button(text: text, flex: flex, padding: padding, bgColor: bgColor, textColor: textColor, onPressed: action);
  }

  _buttonValue({String text, int flex, double padding, ButtonColor bgColor, Color textColor = Colors.white}) {
    var action = () {
      setState(() {
        screenText += text;
      });
    };
    return _button(text: text, flex: flex, padding: padding, bgColor: bgColor, textColor: textColor, onPressed: action);
  }

  _button({String text, int flex, double padding, ButtonColor bgColor, Color textColor = Colors.white, Function onPressed}) {
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
      onPressed: onPressed,
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
        height: 100,
        padding: EdgeInsets.all(padding),
        child: buttonView,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var screen = Expanded(flex: 1, child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: FittedBox(child: Text(
          screenText == '' ? '0' : screenText,
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
              _buttonAction(text: PadActions.clear, flex: 1, padding: 8, bgColor: ButtonColor.grey, textColor: Colors.black),
              _buttonAction(text: PadActions.direction, flex: 1, padding: 8, bgColor: ButtonColor.grey, textColor: Colors.black),
              _buttonAction(text: PadActions.percentage, flex: 1, padding: 8, bgColor: ButtonColor.grey, textColor: Colors.black),
              _buttonAction(text: PadActions.divisor, flex: 1, padding: 8, bgColor: ButtonColor.orange),
            ]),
            Row(children: [
              _buttonValue(text: PadValues.seven, flex: 1, padding: 8),
              _buttonValue(text: PadValues.eight, flex: 1, padding: 8),
              _buttonValue(text: PadValues.nine, flex: 1, padding: 8),
              _buttonAction(text: PadActions.multiply, flex: 1, padding: 8, bgColor: ButtonColor.orange),
            ]),
            Row(children: [
              _buttonValue(text: PadValues.four, flex: 1, padding: 8),
              _buttonValue(text: PadValues.five, flex: 1, padding: 8),
              _buttonValue(text: PadValues.six, flex: 1, padding: 8),
              _buttonAction(text: PadActions.subtract, flex: 1, padding: 8, bgColor: ButtonColor.orange),
            ]),
            Row(children: [
              _buttonValue(text: PadValues.one, flex: 1, padding: 8),
              _buttonValue(text: PadValues.two, flex: 1, padding: 8),
              _buttonValue(text: PadValues.three, flex: 1, padding: 8),
              _buttonAction(text: PadActions.add, flex: 1, padding: 8, bgColor: ButtonColor.orange),
            ]),
            Row(children: [
              _buttonValue(text: PadValues.zero, flex: 2, padding: 8),
              _buttonValue(text: PadValues.decimal, flex: 1, padding: 8),
              _buttonAction(text: PadActions.equals, flex: 1, padding: 8, bgColor: ButtonColor.orange),
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
