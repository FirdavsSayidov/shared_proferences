import 'package:flutter/material.dart';
import 'package:shared_proferences_2/pages/home_page.dart';
import 'package:shared_proferences_2/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        LoginPage.id:(context) => LoginPage(),
        HomePage.id:(context) => HomePage()
      },
    );
  }
}

