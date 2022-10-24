class Post {
  final String title;
  final String body;
  final int id;

  Post({required this.title, required this.body, required this.id});

  Post.fromJSON(Map<String, dynamic> parsedJSON)
      : title = parsedJSON['title'],
        body = parsedJSON['body'],
        id = parsedJSON['id'];
}

