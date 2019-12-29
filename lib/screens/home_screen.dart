import 'package:flutter/material.dart';
import 'package:photome/models/post_model.dart';
import 'package:photome/providers/posts.dart';
import 'package:photome/widgets/posts_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Post> postData = Provider.of<Posts>(context).postList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("PhotoMe"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Transform.rotate(
              child: Icon(Icons.send),
              angle: 330 * 3.14 / 180,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return PostWidgets(
              name: postData[index].name,
              dateTime: postData[index].dateTime,
              post: postData[index].post,
              imgUrl: postData[index].imgUrl,
            );
          },
          itemCount: postData.length,
        ),
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Notifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
