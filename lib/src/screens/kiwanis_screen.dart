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

  Widget cardTemplate(post) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF444488),),
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("${post['lastname']}, ${post['firstname']}",
            style: const TextStyle(color: Colors.blue, fontSize: 30),),
            Text("Spouse: ${post['cb_spousename']}",
              style: const TextStyle(color: Colors.green, fontSize: 20),),
            Text("${post['email']}",
              style: const TextStyle(color: Colors.cyan, fontSize: 20),),
            Text("${post['cb_address']}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),),
            Text("${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),),
            Text("Home Phone:  ${post['cb_homephone']}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),),
            Text("Cell Phone: ${post['cb_mobilephone']}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _posts.map((post) => cardTemplate(post)).toList(),
      ),

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
