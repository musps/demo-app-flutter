import 'package:flutter/material.dart';

void settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return ListView(
            children: [
              ListTile(leading: Icon(Icons.map), title: Text('Action 1')),
              ListTile(leading: Icon(Icons.map), title: Text('Action 2')),
              ListTile(leading: Icon(Icons.map), title: Text('Action 3')),
            ],
          );
      }
    );
}
