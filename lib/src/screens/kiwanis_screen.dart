import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KiwanisScreen extends StatefulWidget {
  const KiwanisScreen({super.key});

  @override // arrow function always returns
  KiwanisScreenState createState() => KiwanisScreenState();
}

class KiwanisScreenState extends State<KiwanisScreen> {
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    http
        .get(Uri.parse('https://monumenthillkiwanis.org/ionic/roster_json.php'))
        .then((res) {
      // res.body is a String. json.decode changes it to objects
      final posts = json.decode(res.body);
      setState(() => _posts = posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: _posts.map((post) {
            return ListTile(
              leading: Text(post['lastname'].toString()),
              title: Text(post['firstname']),
              subtitle: Text(post['cb_homephone']),
            );
          }).toList()),
      /*
      Could also be:
      children: _posts.map((post) => ListTile( title: Text(...), subtitle: Text(...)  )).toList(),
         // Note that "return" along with ";" is not needed in this type of notation
       */
      appBar: AppBar(
        title: const Text('Kiwanis Roster'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
