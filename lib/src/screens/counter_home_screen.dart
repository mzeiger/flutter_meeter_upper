import 'package:flutter/material.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;

  CounterHomeScreen({super.key, required String title}) : _title = title;

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
    print('Calling build');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating button pressed');
          print(_counter++);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Meet Upper'),
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
            Text('Welcome to ${widget._title} let\'s increment numbers'),
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
