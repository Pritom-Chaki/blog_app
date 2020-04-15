import 'package:flutter/material.dart';
import 'NavDrawer.dart';


class UserProfilePage
 extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage
> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("Profile"),
      ),
      drawer: NavDrawer(),
      body: new Container(
        child: Column(
          
        ),

      ),
    );
  }
}