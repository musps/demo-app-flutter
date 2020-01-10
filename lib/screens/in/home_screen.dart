import 'package:flutter/material.dart';
import 'package:testapp/widgets/bottom_menu.dart';
import 'package:testapp/widgets/user_menu_widget.dart';

class InHomeScreen extends StatefulWidget {
  final String title = 'Dashboard';

  InHomeScreen({Key key}) : super(key: key);
  _InHomeScreen createState() => _InHomeScreen();
}

class _InHomeScreen extends State<InHomeScreen> {
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
