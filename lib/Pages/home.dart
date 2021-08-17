// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireabse_demo/Pages/Setup/edit_profile.dart';
import 'package:fireabse_demo/Pages/Setup/welcome.dart';
import 'package:fireabse_demo/Pages/about.dart';
import 'package:fireabse_demo/Pages/database.dart';
import 'package:fireabse_demo/Pages/groups.dart';
import 'package:fireabse_demo/Pages/location_demo.dart';
import 'package:fireabse_demo/Pages/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Home extends StatefulWidget {
  const Home({Key? key, required this.userCredential}) : super(key: key);
  final UserCredential userCredential;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final _auth = FirebaseAuth.instance.collection("Users");
  // late String _email, _password, _username;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // bool _isloading = false;
  bool isloading=true;
  late final User user;
  late final String uid;


  int clappings = 0;
  Map? data;



  fetchData() {

    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Users');
    collectionReference.snapshots().listen((snapshot) {
      // List documents;
      setState(() {
        var data = snapshot.docs[0].data();
      });
    });
  }
  delete() async{
      setState(() {
        isloading = true;
      });
      await deleteAccount(context);
  }

  Future<dynamic> deleteAccount(BuildContext context) async{
    return showDialog(context: context,builder:(BuildContext context)
    {
      child:
      return AlertDialog(
        title: Text('Are your sure?', style: TextStyle(
          color: Colors.black,
          letterSpacing: 2,
        ),),
        actions: <Widget>[
          ElevatedButton(onPressed: () async {
            setState(() {
              isloading = true;
            });
            await FirebaseFirestore.instance.collection('Users').doc(uid).delete();
            await FirebaseAuth.instance.currentUser!.delete();

            FirebaseAuth.instance.signOut();
            SharedPreferences preferences = await SharedPreferences.getInstance();

            await preferences.clear();

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
            setState(() {
              isloading = false;
            });
          }, child: Text('Yes'),),
          ElevatedButton(onPressed: () async {
            setState(() {
              isloading = false;
            });
            Navigator.of(context).pop();
          }, child: Text('No'),),
        ],
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: AppBar(

        title: Text('Home Page',
            style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2,

            )),
        centerTitle: true,
        backgroundColor: Colors.brown,


        elevation: 0.0,

      ),
      drawer: Drawer(


            child: Container(color: Colors.grey[900],child : new ListView(children: [
              // new ListTile(leading: new Icon(Icons.info),),
              UserAccountsDrawerHeader(
                  accountName:isloading?Text("User"):Text(username, textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                  )),
                  accountEmail: Text(user.email!,  textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                  ))
              ),
              InkWell(

                child:  new Column(
                  children: <Widget>[
                const Divider(
                height: 1.0,
                ),
                new ListTile(

                  leading: Icon(Icons.person,color: Colors.white),
                  title: Text("My Profile", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic
                  )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditProfilePage(
                            username: username),
                      ),
                    );
                  },
                ),
                new ListTile(
                  leading: Icon(Icons.vpn_key_outlined, color: Colors.white),
                  title: Text("Tap here to change password", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic
                  )),
                  onTap: () {
                        Navigator.push(
                         context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()));

                       }

                ),
                    ListTile(
                        leading: Icon(Icons.logout, color: Colors.white),
                        title: Text("Log Out", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontStyle: FontStyle.italic
                        )),
                        onTap: logout,

                    ),
              ],),
            )])),


      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clappings += 1;
          });
        },
        child: Image(image: AssetImage("images/clapping_hand.jpg"),
          fit: BoxFit.contain,),
        backgroundColor: Colors.grey[800],
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Welcome $username!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                  fontSize: 24,
                  letterSpacing: 2,
                )
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 40,
              onPressed: navigatetogroups,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Group page',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 40,
              onPressed: navigatetoEditProfile,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('To change password click here',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 30),

            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 40,
              onPressed: delete,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Click to delete your account',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 40,
              onPressed: navigatetoAbout,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('About the app',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 150),

            Text(
              'If you want to praise the app and efforts :)',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),

            SizedBox(height: 10),

            Text(
                '$clappings',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),


          ],
        ),


      ),
    );
  }
  void navigatetogroups(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Groups(username: username,)));

  }

  void navigatetoEditProfile(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordScreen()));

  }
  void navigatetoAbout(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => About(), fullscreenDialog: true));
  }


  @override
  void initState() {
    super.initState();
    //Getting current user

    user = auth.currentUser!;
    uid = user.uid;
    getUsername();
  }
  String username = "user";
  getUsername() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      username= (await prefs.getString('username'))!;
      setState(() {
        isloading = false;
      });
    } catch (e) {
      return null;
    }}

  logout() async {
    setState(() {
      isloading = true;
    });
    FirebaseAuth.instance.signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()));



    setState(() {
      isloading = false;
    });
  }

}









