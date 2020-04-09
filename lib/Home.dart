import 'package:flutter/material.dart';
import 'package:new_project/Intent.dart';
import 'package:new_project/widget/local_notification.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _PageOption = [
    LocalNotification(),
    Menu(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PageOption[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            title: Text('Notification'),
            backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            title: Text('Intent'),
            backgroundColor: Colors.blue
            ),
        ],),
    );
  }
}