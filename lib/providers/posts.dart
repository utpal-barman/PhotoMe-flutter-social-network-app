import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photome/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:photome/providers/auth.dart';

class Posts with ChangeNotifier {
  List<Post> _postList = [
    // Post(
    //   dateTime: DateTime.now(),
    //   imgUrl:
    //       "https://images.unsplash.com/photo-1516705346105-1604914311cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
    //   name: "rinku_s",
    //   post: "nice weather indeed!",
    // ),
    // Post(
    //   dateTime: DateTime.now(),
    //   imgUrl:
    //       "https://pbs.twimg.com/profile_images/1003539736152031233/lsCeD5pq_400x400.jpg",
    //   name: "utpal_barman",
    //   post: "nice weather indeed!",
    // ),
    // Post(
    //   dateTime: DateTime.now(),
    //   imgUrl:
    //       "https://media.geeksforgeeks.org/wp-content/uploads/first_run_vscode_gfg.png",
    //   name: "_utpal_",
    //   post: "i love to do some coding",
    // ),
  ];

  List<Post> get postList => [..._postList];

  String _authToken;

  set authToken(String value) {
    _authToken = value;
    print(
        "I'm Posts Provider: I am getting token $value from Auth Provider. Thanks Auth.");
  }

  Future<void> fetchAndSetData() async {
    try {
      final url =
          "https://photome-16521.firebaseio.com/posts.json?auth=$_authToken";

      final response = await http.get(url);

      final List<Post> loadedData = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print(extractedData);

      extractedData.forEach(
        (id, dynamicData) => loadedData.add(
          Post(
            dateTime: null,
            imgUrl: dynamicData["imgUrl"],
            name: dynamicData["name"],
            post: dynamicData["post"],
          ),
        ),
      );
      _postList = loadedData;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> writeData() async {
    const url = "https://photome-16521.firebaseio.com/posts.json";

    await http.post(url,
        body: json.encode({
          'imgUrl':
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_1QxBTLmtXdVh2WuTOmFycAxVqQ9Do8xRXOz5sNjDWy6kfkb3&s",
          'name': "utpal_s",
          'post': "flutter is awesome",
        }));

    notifyListeners();
  }
}
