import 'package:flutter/material.dart';
import 'HomePage.dart';


class NavDrawer extends StatefulWidget {
  //Method
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  HomePage homePageOBJ = new HomePage();

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Atul"),
              accountEmail: new Text("atulbeniwal43@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("images/abstract.jpg"),
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () {
              },
            ),
            new ListTile(
              title: new Text("Profile"),
              trailing: new Icon(Icons.arrow_drop_down_circle),
              onTap: () {
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Search"),
              trailing: new Icon(Icons.search),
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.close),
              onTap: () 
              {
                
              }
            ),
          ],
        ),
    );
  }
}
