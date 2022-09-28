import 'package:flutter/material.dart';

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
          children: [
            Text('Welcome to ${widget._title}, let\'s increment numbers'),
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 30),
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
      bottomNavigationBar: _BottomNavigation(),
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

class _BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() => _currentIndex = index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white),
      ],
      backgroundColor: Colors.grey,
      showSelectedLabels: true,
    );
  }
}
