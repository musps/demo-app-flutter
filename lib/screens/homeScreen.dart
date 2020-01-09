import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  final String title = 'Home screen';

  HomeScreen({Key key}) : super(key: key);
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      print('_HomeScreen');
      var isLogged = await Provider.of<UserProvider>(context, listen: false).initialize();

      if (!isLogged) {
        Navigator.pushReplacementNamed(context, '/auth/login');
      } else {
        Navigator.pushReplacementNamed(context, '/in/profile');
      }
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
