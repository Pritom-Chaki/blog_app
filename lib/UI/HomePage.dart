import 'package:flutter/material.dart';
import 'package:blog_app/Services/Authentication.dart';
import 'NavDrawer.dart';
import 'PhotoUpload.dart';
import 'package:blog_app/Model/Posts.dart';
import 'package:firebase_database/firebase_database.dart';


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

  List<Posts> postsList = [];
  @override
  void initState() {
    super.initState();

    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child("Posts");
    postsRef.once().then((DataSnapshot snap) {
      var keyS = snap.value.keys;
      var dataS = snap.value;

      postsList.clear();

      for (var individualKey in keyS) {
        Posts posts = new Posts(
          dataS[individualKey]['image'],
          dataS[individualKey]['description'],
          dataS[individualKey]['date'],
          dataS[individualKey]['time'],
        );
        postsList.add(posts);
      }
      setState(() {
        print('Length : $postsList.length');
      });
    });
  }

  void _logoutuser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
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
      body: new Container(
        child: postsList.length == 0
            ? new Text("No Blog Post Availble")
            : new ListView.builder(
                itemCount: postsList.length,
                itemBuilder: (_, index) {
                  return postUI(
                      postsList[index].image,
                      postsList[index].description,
                      postsList[index].date,
                      postsList[index].time);
                }),
      ),
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return new UploadPhotoPage();
                    }));
                  },
                )
              ],
            ),
          )),
    );
  }

  Widget postUI(String image, String description, String date, String time) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
          padding: new EdgeInsets.all(14.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    time,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              new Image.network(image, fit: BoxFit.cover),
              SizedBox(height: 10.0,),
              new Text(
                description,
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
