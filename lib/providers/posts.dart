import 'package:flutter/material.dart';
import 'package:photome/models/post_model.dart';

class Posts with ChangeNotifier {
  List<Post> _postList = [
    Post(
      dateTime: DateTime.now(),
      imgUrl:
          "https://images.unsplash.com/photo-1516705346105-1604914311cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
      name: "rinku_s",
      post: "nice weather indeed!",
    ),
    Post(
      dateTime: DateTime.now(),
      imgUrl:
          "https://pbs.twimg.com/profile_images/1003539736152031233/lsCeD5pq_400x400.jpg",
      name: "utpal_barman",
      post: "nice weather indeed!",
    ),
    Post(
      dateTime: DateTime.now(),
      imgUrl:
          "https://media.geeksforgeeks.org/wp-content/uploads/first_run_vscode_gfg.png",
      name: "_utpal_",
      post: "i love to do some coding",
    ),
    Post(
      dateTime: DateTime.now(),
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_1QxBTLmtXdVh2WuTOmFycAxVqQ9Do8xRXOz5sNjDWy6kfkb3&s",
      name: "utpal_barman",
      post: "flutter is awesome man",
    ),
  ];

  List<Post> get postList => [..._postList];
}
