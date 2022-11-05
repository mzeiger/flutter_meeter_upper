import 'package:flutter/material.dart';
import 'package:meeter_upper/src/models/post.dart';
import 'package:meeter_upper/src/scoped_model/post_model.dart';
import 'package:meeter_upper/src/widgets/bottom_navigation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meeter_upper/src/state/app_state.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<PostModel>(model: PostModel(), child: _PostList());
  }
}

class _InheritedPost extends InheritedWidget {
  final Widget child;
  final List<Post> posts;
  final Function createPost;

  _InheritedPost({required this.child, required this.posts, required this.createPost})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static _InheritedPost of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedPost>()
        as _InheritedPost);
  }
}

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final posts =
    //    (context.dependOnInheritedWidgetOfExactType<_InheritedPost>() as _InheritedPost)
    //        .posts;
    //final testingData = AppStore.of(context).testingData2;

    return ScopedModelDescendant<PostModel>(
      builder: (context, _, model) {
        final posts = model.posts;
        return Scaffold(
          body: ListView.builder(
            itemCount: model.posts.length * 2,
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
          appBar: AppBar(title: Text(model.testingState), centerTitle: true),
        );
      },
    );
  }
}

class _PostButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final postModel = ScopedModel.of<PostModel>(context, rebuildOnChange: true);
    return FloatingActionButton(
      onPressed: postModel.addPost,
      tooltip: 'Add Post',
      child: const Icon(Icons.add),
    );
  }
}
