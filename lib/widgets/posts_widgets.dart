import 'package:flutter/material.dart';

class PostWidgets extends StatefulWidget {
  final String name;
  final DateTime dateTime;
  final String post;
  int likes = 0;
  final String imgUrl;

  PostWidgets({
    this.name,
    this.dateTime,
    this.post,
    this.imgUrl,
  });

  @override
  _PostWidgetsState createState() => _PostWidgetsState();
}

class _PostWidgetsState extends State<PostWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.imgUrl),
            ),
            title: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Mirpur, Dhaka"),
            trailing: Icon(Icons.more_vert),
          ),
          Container(
            color: Colors.grey[50],
            width: double.infinity,
            height: 400,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  widget.likes++;
                });
              },
              child: Image.network(
                widget.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        widget.likes > 0
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.likes > 0 ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.likes++;
                        });
                      },
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${widget.likes} Like",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
