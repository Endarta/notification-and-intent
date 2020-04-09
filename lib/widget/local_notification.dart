import 'package:new_project/local_notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_project/page/second_page.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  final notifications = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
      );
  @override
Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            title('Notification'),
            RaisedButton(
              child: Text('Show Notfication'),
              onPressed: () => showOngoingNotification(notifications,
                  title: 'Title', body: 'Uhuy'),
            ),
            RaisedButton(
              child: Text('Show 2 Button'),
              onPressed: () => showOngoingNotification(notifications,
                  title: 'title', body: 'jangan pergi'),
            ),
            RaisedButton(
              child: Text('Other notification'),
              onPressed: () => showOngoingNotification(notifications,
                  title: 'OtherTitle', body: 'Tanyakan rumput', id: 20),
            ),
            // const SizedBox(height: 32),
            // title('Feautures'),
            // RaisedButton(
            //   child: Text('Silent notification'),
            //   onPressed: () => showSilentNotification(notifications,
            //       title: 'SilentTitle', body: 'SilentBody', id: 30),
            // ),
            const SizedBox(height: 32),
            title('Clear'),
            RaisedButton(
              child: Text('Clear all notification'),
              onPressed: notifications.cancelAll,
            ),
          ],
        ),
      );

  Widget title(String text) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
      );
}