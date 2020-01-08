import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/in/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff008397),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/auth/login': (context) => LoginScreen(),
        '/auth/register': (context) => RegisterScreen(),
        '/auth/forgot_password': (context) => ForgotPasswordScreen(),
        '/in/profile': (context) => ProfileScreen(),
      },
    );
  }
}
