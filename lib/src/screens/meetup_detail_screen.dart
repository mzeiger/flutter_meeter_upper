import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class MeetupDetailScreen extends StatelessWidget {
  const MeetupDetailScreen({Key? key}) : super(key: key);

  static const String route = 'meetupDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meetup Detail',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: const Center(
        child: Text('Meetup Detail Screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
