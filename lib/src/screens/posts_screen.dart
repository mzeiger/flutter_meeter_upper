import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override // arrow function always returns
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
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
              leading: Text(post['id'].toString()),
              title: Text(post['title']),
              subtitle: Text(post['body']),
            );
      }).toList()),
      /*
      Could also be:
      children: _posts.map((post) => ListTile( title: Text(...), subtitle: Text(...)  )).toList(),
         // Note that "return" along with ";" is not needed in this type of notation
       */
      appBar: AppBar(
        title: const Text('Posts'),
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
