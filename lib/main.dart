import 'package:flutter/material.dart';
import 'package:meeter_upper/src/screens/meetup_detail_screen.dart';
import 'package:meeter_upper/src/screens/posts_screen.dart';
import 'package:meeter_upper/src/state/app_state.dart';

void main() => runApp(const AppStore(child: MeetuperApp()));

class MeetuperApp extends StatelessWidget {
  final String appTitle = 'Meetuper App';

  const MeetuperApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: CounterHomeScreen(title: appTitle),
      home: PostScreen(),
      routes: {
        MeetupDetailScreen.route: (context) => const MeetupDetailScreen()
      },
    );
  }
}



