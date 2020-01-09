import 'package:flutter/material.dart';
import 'package:testapp/widgets/bottom_menu.dart';
import 'package:testapp/widgets/user_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  final String title = 'Profile screen';

  ProfileScreen({Key key}) : super(key: key);
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(child: UserMenuWidget()),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => settingModalBottomSheet(context),
        child: new Icon(Icons.add),
      ),
      body: Container(
        child: Text('content')
      ),
    );
  }
}
