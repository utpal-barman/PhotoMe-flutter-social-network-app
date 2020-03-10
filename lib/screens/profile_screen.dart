import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text("Annoymous User"),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.settings,
              ),
            ),
            title: Text("Edit Profile"),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(24.0),
            width: double.infinity,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Sign Out",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
