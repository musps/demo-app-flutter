import 'package:flutter/material.dart';
import '../menuScreen.dart';
import '../../components/bottomMenu.dart';

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
      drawer: Drawer(child: MenuScreen()),
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
