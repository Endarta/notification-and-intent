import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child : Text('data'),
            color: Colors.blueAccent,
            splashColor: Colors.white,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}