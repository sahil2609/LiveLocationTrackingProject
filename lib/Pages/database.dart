
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String username;


  const EditProfilePage(
      {Key? key, required this.username})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final String uid;
  late final User user;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: new AppBar(
        title: new Text('My profile', style: TextStyle(
            color: Colors.amber,
            letterSpacing: 2,
            fontStyle: FontStyle.italic
        )),
        centerTitle: true,
        backgroundColor: Colors.brown),

      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: Icon(Icons.label,color: Colors.white,),
              title: const Text('Username',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
              )),
              subtitle: Text(widget.username,style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 2,
              )),
            ),
            ListTile(
              leading: Icon(Icons.group,
                color: Colors.white,),
              title: const Text('Email Address',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
              )),
              subtitle: Text(user.email!,style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 2,
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    uid = user.uid;
  }

}