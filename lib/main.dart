import 'package:flutter/material.dart';
import 'package:photome/providers/posts.dart';
import 'package:photome/screens/auth-screen.dart';
import 'package:photome/screens/home_screen.dart';
import 'package:photome/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Posts>(
          create: (_) => Posts(),
          update: (_, auth, previousPosts) =>
              previousPosts..authToken = auth.token,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PhotoMe',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.lime,
        ),
        home: AuthScreen(),
        routes: {
          '/auth-screen': (context) => AuthScreen(),
          '/home-screen': (context) => HomeScreen(),
          '/profile-screen': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
