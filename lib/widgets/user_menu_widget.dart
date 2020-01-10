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
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Welcome'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Pokedex'),
            leading: Icon(Icons.list),
            onTap: () => Navigator.popAndPushNamed(context, '/in/pokedex'),
          ),
          ListTile(
            title: Text('Calculator'),
            leading: Icon(Icons.view_list),
            onTap: () => Navigator.popAndPushNamed(context, '/in/calculator'),
          ),
          ListTile(
            title: Text('Degrees Conversion'),
            leading: Icon(Icons.data_usage),
            onTap: () => Navigator.popAndPushNamed(context, '/in/degrees_conversion'),
          ),
          ListTile(
            title: Text('Disconnect'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              await Provider.of<UserProvider>(context, listen: false).disconnect();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
