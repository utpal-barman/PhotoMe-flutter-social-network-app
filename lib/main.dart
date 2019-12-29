import 'package:flutter/material.dart';
import 'package:photome/providers/posts.dart';
import 'package:photome/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Posts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PhotoMe',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.lime,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
