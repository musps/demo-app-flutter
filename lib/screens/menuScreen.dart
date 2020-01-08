import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final String title = 'Menu';

  MenuScreen({Key key}) : super(key: key);
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Disconnect'),
            onTap: () => Navigator.pushReplacementNamed(context, '/auth/login'),
          ),
        ]
      )
    );
  }
}
