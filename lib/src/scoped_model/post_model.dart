import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../services/post_api_provider.dart';
import '../models/post.dart';

class PostModel extends Model {
  List<Post> posts = [];
  final testingState = 'Testing State';
  final PostApiProvider _api = PostApiProvider();

  PostModel() {
    _fetchPosts();
  }

  void _fetchPosts() async {
    List<Post> posts = await _api.fetchPosts();
    this.posts = posts;
    notifyListeners();
  }

  addPost() {
    final id = faker.randomGenerator.integer(9999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    final newPost = Post(title: title, body: body, id: id);

    posts.add(newPost);

    notifyListeners();
  }
}
