import 'package:flutter/material.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;

  const CounterHomeScreen({super.key, required String title}) : _title = title;

  @override
  CounterHomeScreenState createState() {
    return CounterHomeScreenState();
  }
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to ${widget._title}, let\'s increment numbers'),
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
