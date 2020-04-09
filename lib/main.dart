import 'package:flutter/material.dart';
import 'package:new_project/Home.dart';
import 'package:new_project/widget/local_notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Local Notifications';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
    
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Home(),
        ),
      );
}