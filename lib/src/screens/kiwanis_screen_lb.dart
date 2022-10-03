import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/kiwanis_card_widget.dart';

class KiwanisScreenLB extends StatefulWidget {
  const KiwanisScreenLB({super.key});

  @override // arrow function always returns
  KiwanisScreenLBState createState() => KiwanisScreenLBState();
}

class KiwanisScreenLBState extends State<KiwanisScreenLB> {
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    http
        .get(Uri.parse('https://monumenthillkiwanis.org/ionic/roster_json_2.php'))
        .then((res) {
      // res.body is a String. json.decode changes it to objects
      final posts = json.decode(res.body);
      // if using roster_json_2.php then must get ['members']
      // if using roster_json.php then don't use ['members']
      setState(() => _posts = posts['members']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return cardTemplate(_posts[index]);
          }
          //children: _posts.map((post) => cardTemplate(post)).toList(),
        ),
      ),
      appBar: AppBar(
        title: const Text('Kiwanis Roster LB'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      //bottomNavigationBar: const BottomNavigation(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
