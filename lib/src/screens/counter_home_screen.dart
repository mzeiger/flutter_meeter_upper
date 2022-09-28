import 'package:flutter/material.dart';
import 'package:meeter_upper/src/screens/meetup_detail_screen.dart';

import '../widgets/bottom_navigation.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;

  const CounterHomeScreen({super.key, required String title}) : _title = title;

  @override // arrow function always returns
  CounterHomeScreenState createState() => CounterHomeScreenState();
}

class CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;

  _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to ${widget._title}, let\'s increment numbers'),
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MeetupDetailScreen.route),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.red),
              child: const Text('Go to Detail Screen'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

