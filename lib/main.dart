import 'package:flutter/material.dart';
import 'package:meeter_upper/src/screens/counter_home_screen.dart';
import 'package:meeter_upper/src/screens/meetup_detail_screen.dart';

void main() => runApp(const MeetupperApp());

class MeetupperApp extends StatelessWidget {
  const MeetupperApp({super.key});
  final String appTitle = 'Meet Upper';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CounterHomeScreen(title: appTitle),
        routes: {
          MeetupDetailScreen.route: (context) => const MeetupDetailScreen(),
        }

    );
  }
}
