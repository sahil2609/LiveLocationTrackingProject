import 'package:flutter/material.dart';
// import 'package:locus_stalker/constants.dart';
// import '../components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? loggedInUser;

class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'reset_password_screen';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  String? newPassword;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Re-set Password',
            style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2,
                fontStyle: FontStyle.italic
            )),
        centerTitle: true,
        backgroundColor: Colors.brown,


        elevation: 0.0,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              newPassword = value;
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

                labelText: 'New password',
                hintText: 'Enter new password',
                hintStyle: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                ),
            ),
          ),
          const Divider(
            height: 2.0,
          ),
          RaisedButton(
            child:
            // colour: Colors.grey.shade800,
            Text ('Set password',style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              letterSpacing: 2,
            )),
            onPressed: () {
              try {
                loggedInUser!.updatePassword(newPassword!);
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}