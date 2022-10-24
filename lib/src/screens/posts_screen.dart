import 'package:flutter/material.dart';
import 'package:meeter_upper/src/models/post.dart';
import 'package:meeter_upper/src/widgets/bottom_navigation.dart';
import 'package:faker/faker.dart';
import 'package:meeter_upper/services/post_api_provider.dart';

class PostScreen extends StatefulWidget {
  final PostApiProvider _api = PostApiProvider();

  PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    List<Post> posts = await widget._api.fetchPosts();
    setState(() => _posts = posts);
  }

  _addPost() {
    final id = faker.randomGenerator.integer(9999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    final newPost = Post(title: title, body: body, id: id);

    setState(() => _posts.add(newPost));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPost(posts: _posts, createPost: _addPost, child: _PostList());
  }
}

class _InheritedPost extends InheritedWidget {
  final Widget child;
  final List<Post> posts;
  final Function createPost;

  const _InheritedPost(
      {required this.child, required this.posts, required this.createPost})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedPost>()
        as _InheritedPost);
  }
}

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts =
        (context.dependOnInheritedWidgetOfExactType<_InheritedPost>() as _InheritedPost)
            .posts;

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length * 2,
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return const Divider();
          }

          final index = i ~/ 2;

          return ListTile(
              title: Text(posts[index].title), subtitle: Text(posts[index].body));
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: _PostButton(),
      appBar: AppBar(title: const Text('Posts'), centerTitle: true),
    );
  }
}

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _InheritedPost.of(context).createPost,
      tooltip: 'Add Post',
      child: const Icon(Icons.add),
    );
  }
}
