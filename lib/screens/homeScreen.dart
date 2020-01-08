import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title = 'Home screen';

  HomeScreen({Key key}) : super(key: key);
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Navigator.pushReplacementNamed(context, '/auth/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    //Navigator.pushNamed(context, '/auth/login');
    //Navigator.of(context).pushNamed('/auth/login');

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

