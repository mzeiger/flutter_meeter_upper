import 'package:flutter/material.dart';

void main() => runApp(const MeetupperApp());


class MeetupperApp extends StatelessWidget {
  const MeetupperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  Center(
        child: Text('Welcome to Meetupper App',
          style: TextStyle(fontSize: 20,
          decoration: TextDecoration.none,
          color: Colors.white,),
        ),
      ),
    );
  }

}

