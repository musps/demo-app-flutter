import 'package:flutter/material.dart';
import '../../providers/theme.dart';
import '../../widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {
  final String title = 'Login';

  LoginScreen({Key key}) : super(key: key);
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Center(child: Text('%APP LOGO%')),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email address')
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    ButtonWidget(
                      text: 'Forgot password?',
                      onPressed: () => Navigator.pushNamed(context, '/auth/forgot_password'),
                    ),
                    Spacer(),
                    ButtonWidget(
                      text: 'Login',
                      onPressed: () => Navigator.pushNamed(context, '/in/profile'),
                      color: Theme.of(context).customerPrimaryColor,
                      textColor: Colors.white,
                    ),
                    ButtonWidget(
                      text: 'Register',
                      onPressed: () => Navigator.pushNamed(context, '/auth/login'),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
