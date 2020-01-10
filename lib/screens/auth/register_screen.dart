import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final String title = 'Register';

  RegisterScreen({Key key}) : super(key: key);
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(child: Text('Feature not available yet!')),
      )
    );
  }
}
