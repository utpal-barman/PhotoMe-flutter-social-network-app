import 'package:flutter/material.dart';

class Post {
  final String name;
  final DateTime dateTime;
  final String post;
  final int likes = 0;
  final String imgUrl;

  Post({
    @required this.name,
    @required this.dateTime,
    @required this.post,
    @required this.imgUrl,
  });
}
