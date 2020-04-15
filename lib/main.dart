import 'package:blog_app/UI/UserInfoUpload.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/Services/Mapping.dart';
import 'package:blog_app/Services/Authentication.dart';

void main() {
  runApp(new BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Blog App",
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
     home: MappingPage(auth: Auth(),),
    
    );
  }
}
