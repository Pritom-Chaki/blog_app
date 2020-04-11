import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'NavDrawer.dart';

class HomePage extends StatefulWidget {

  HomePage({
        this.auth,
        this.onSignedOut,

  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //Method Part

  void _logoutuser() async {
    try{
        await widget.auth.signOut();
        widget.onSignedOut();
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  //Design Part
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      drawer: NavDrawer(),
      body: new Container(),
      bottomNavigationBar: new BottomAppBar(
          color: Colors.indigo,
          child: new Container(
            margin: const EdgeInsets.only(left: 70.0, right: 70.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.local_car_wash),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: _logoutuser,
                ),
                new IconButton(
                    icon: new Icon(Icons.add_a_photo),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: null)
              ],
            ),
          )),
    );
  }
}
