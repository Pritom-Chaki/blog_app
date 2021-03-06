import 'package:flutter/material.dart';
import 'package:blog_app/Services/Authentication.dart';
import 'package:blog_app/Shared/DialogBox.dart';
import 'package:blog_app/Shared/loading.dart';


class LoginRegisterPage extends StatefulWidget {

LoginRegisterPage({

this.auth,
this.onSignedIn
});

    final AuthImplementation auth;
    final VoidCallback onSignedIn;


  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }

}

enum FormType { login, register }

class _LoginRegisterState extends State<LoginRegisterPage> {

DialogBox dialogBox = new DialogBox();

  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  bool loading = false;

  //Method Part

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async
  {
    if(validateAndSave())
    {
      loading = true;
      try{
        if(_formType == FormType.login)
        {
          String userId = await widget.auth.signIn(_email, _password);
        // dialogBox.information(context, "Congratulations", "You logged in succesfully!");
          print("Login userId = $userId");
          loading = false;
        }
        else{
          String userId = await widget.auth.signUp(_email, _password);
         // dialogBox.information(context, "Congratulations", "Your account has been created succesfully!");
          print("Register userId = $userId");
          loading = false;
        }
        widget.onSignedIn();
      }
      catch(e)
      {
        dialogBox.information(context, "Error = ", e.toString());
          print ("Error = " + e.toString());
      }
    }

  }

  void moveToRegister() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  //Design Part
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Blog App"),
      ),
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            ),
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
          validator: (value) {
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value) {
            return _email = value;
          }),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
          decoration: new InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: (value) {
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value) {
            return _password = value;
          }),
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
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.pink,
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text("Not have an account? Create one",
              style: new TextStyle(fontSize: 14.0)),
          textColor: Colors.blue,
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        new RaisedButton(
          child:
              new Text("Create Account", style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.pink,
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text("Already have an account? Login",
              style: new TextStyle(fontSize: 14.0)),
          textColor: Colors.blue,
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
