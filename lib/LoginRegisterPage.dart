import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }
}

class _LoginRegisterState extends State<LoginRegisterPage> {
  //Method Part

  void validateAndSave() {}

  void moveToRegister() {}

  //Design Part
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Blog App"),
      ),
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
      ),
      SizedBox(
        height: 10.0,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        radius: 100.0,
        child: Image.asset('images/blog_logo.jpg'),
      ),
    );
  }

  List<Widget> createButtons() {
    return [
      new RaisedButton(
        child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.yellow,
        onPressed: validateAndSave,
      ),
      new FlatButton(
        child: new Text("Not have an account? Create one",
            style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.blue,
        onPressed: moveToRegister,
      ),
    ];
  }
}
