import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String title = 'Forgot password? ';

  ForgotPasswordScreen({Key key}) : super(key: key);
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Text('content'),
      )
    );
  }
}
