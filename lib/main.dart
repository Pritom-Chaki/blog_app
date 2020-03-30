import 'package:flutter/material.dart';
import 'LoginRegisterPage.dart';

void main() {
  runApp(new BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Blog App",
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginRegisterPage(),
    );
  }
}
