// import 'package:firebase_demo/Pages/Setup/signIn.dart';
import 'package:fireabse_demo/Pages/Setup/firebase.dart';
import 'package:fireabse_demo/Pages/Setup/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_showcase/pages/setup/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password, _username;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: new AppBar(title: Text('Sign up',style: TextStyle(
          color: Colors.amber,
          letterSpacing: 2,
      )),
      centerTitle: true,
        backgroundColor: Colors.brown,


        elevation: 0.0,),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (input) {
                  if(input!.isEmpty){
                    return 'Provide a username';
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: new OutlineInputBorder(

                      borderRadius: const BorderRadius.all(

                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black38,
                        width: 1.0,
                      ),),
                    labelText: 'Username'
                ),
                onSaved: (input) => _username = input!,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (input) {
                  if(input!.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: new OutlineInputBorder(

                      borderRadius: const BorderRadius.all(

                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black38,
                        width: 1.0,
                      ),),
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input!,

              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (input) {
                  if(input!.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: new OutlineInputBorder(

                      borderRadius: const BorderRadius.all(

                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black38,
                        width: 1.0,
                      ),),
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input!,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),
            ],
          )
      ),
    );
  }

  signUp() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        User? updateUser = FirebaseAuth.instance.currentUser;
        // var _usernameController;
        updateUser!.updateProfile(displayName: _username);
        userSetup(_username, _email);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        // print(e.message);
        return "ERROR";
      }
    }
  }
}