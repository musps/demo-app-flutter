import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/models/user_model.dart';
import 'package:testapp/providers/theme.dart';
import 'package:testapp/widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {
  final String title = 'Login';

  LoginScreen({Key key}) : super(key: key);
  _LoginScreen createState() => _LoginScreen();
}

String validateEmpty(String value) {
  if (value.isEmpty) {
    return "Value can't be blank";
  }
  return null;
}

void showFormDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CircularProgressIndicator()
            )
          ],
        ),
      );
    },
  );
}

formGlobalError({String message, bool hidden = false}) {
  return hidden ? Container() : Text(
    message,
    style: TextStyle(color: Colors.red)
  );
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool _globalError = false;

  void onPressLogin() {
    if (!_formKey.currentState.validate()) {
      return null;
    }

    showFormDialog(context);

    // Mock fake latency.
    new Future.delayed(new Duration(seconds: 1), () async {
      Navigator.pop(context);

      if (email.text == 'root' && password.text == 'root') {
        User user = User(email: email.text, password: password.text);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJSON()));
        Navigator.pushNamed(context, '/in/profile');
      }
    });
  }

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      formGlobalError(
                        message: 'Login failed wrong user credentials',
                        hidden: !_globalError,
                      ),
                      TextFormField(
                        controller: email,
                        validator: validateEmpty,
                        decoration: InputDecoration(labelText: 'Email address'),
                      ),
                      TextFormField(
                        controller: password,
                        validator: validateEmpty,
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
                        onPressed: () => onPressLogin(),
                        color: Theme.of(context).customerPrimaryColor,
                        textColor: Colors.white,
                      ),
                      ButtonWidget(
                        text: 'Register',
                        onPressed: () => Navigator.pushNamed(context, '/auth/register'),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
