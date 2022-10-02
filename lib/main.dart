import 'package:flutter/material.dart';
import 'package:meeter_upper/src/screens/counter_home_screen.dart';
import 'package:meeter_upper/src/screens/kiwanis_screen.dart';
import 'package:meeter_upper/src/screens/meetup_detail_screen.dart';
import 'package:meeter_upper/src/screens/posts_screen.dart';

void main() => runApp(const MeetupperApp());

class MeetupperApp extends StatelessWidget {
  const MeetupperApp({super.key});
  final String appTitle = 'Meet Upper';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        //home: CounterHomeScreen(title: appTitle),
        // home: PostScreen(),
        home: const KiwanisScreen(),
        routes: {
          MeetupDetailScreen.route: (context) => const MeetupDetailScreen(),
        }

    );
  }
}
