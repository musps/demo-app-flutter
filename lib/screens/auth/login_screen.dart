import 'package:flutter/material.dart';
import '../../providers/theme.dart';

class LoginScreen extends StatefulWidget {
  final String title = 'Login';

  LoginScreen({Key key}) : super(key: key);
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () => Navigator.pushNamed(context, '/forgot_password'),
                      height: 46,
                      child: Text('Forgot password?', style: new TextStyle(fontSize: 18)),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () => Navigator.pushReplacementNamed(context, '/in/profile'),
                      child: Text('Login', style: new TextStyle(fontSize: 18)),
                      height: 46,
                      color: Theme.of(context).customerPrimaryColor,
                      textColor: Colors.white,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 46,
                      onPressed: () => Navigator.pushNamed(context, '/auth/register'),
                      child: Text('Register', style: new TextStyle(fontSize: 18)),
                    )
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
