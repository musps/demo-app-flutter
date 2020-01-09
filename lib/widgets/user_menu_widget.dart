import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/user_provider.dart';

class UserMenuWidget extends StatefulWidget {
  final String title = 'Menu';

  UserMenuWidget({Key key}) : super(key: key);
  _UserMenuWidget createState() => _UserMenuWidget();
}

class _UserMenuWidget extends State<UserMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Calculator'),
            onTap: () => Navigator.pushReplacementNamed(context, '/in/calculator'),
          ),
          ListTile(
            title: Text('Degrees Conversion'),
            onTap: () => Navigator.pushReplacementNamed(context, '/in/degrees_conversion'),
          ),
          ListTile(
            title: Text('Disconnect'),
            onTap: () async {
              await Provider.of<UserProvider>(context, listen: false).disconnect();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ]
      )
    );
  }
}
