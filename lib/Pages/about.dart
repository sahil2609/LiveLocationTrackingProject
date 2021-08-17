import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,

      backgroundColor: Colors.grey[900],
      appBar: AppBar(

        title: Text('About the App',
            style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2,
                fontStyle: FontStyle.italic
            )),
        centerTitle: true,
        backgroundColor: Colors.brown,


        elevation: 0.0,

      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Live Location Tracking App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration:TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 24,
                    letterSpacing: 2,
                  )
              ),

              SizedBox(height: 20),
              Text(
                '• This app is developed with the motto to help people stay connected with their loved ones by knowing their exact location.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    )
              ),
              SizedBox(height: 20),
              Text(
                  '• After creating an account the user can crete a group with an option to add to all the users (s)he want in that group.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )
              ),
              SizedBox(height: 20),
              Text(
                  '• After creating an account the user can crete a group with an option to add to all the users (s)he want in that group.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )
              ),
              SizedBox(height: 20),
              Text(
                  '• Below the groups name, using the "Location data" button, one can view the current location of all the existing users in the group.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )
              ),
              SizedBox(height: 20),
              Text(
                  '• There ar also options to change password and delete account.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )
              ),
              SizedBox(height: 60),
              Row(
                children: <Widget>[
                  Text('Developed by',
                      style: TextStyle(
                        decoration:TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 18,
                        letterSpacing: 2,
                      )
                  ),
                  Text('  -     ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                  Icon(
                    Icons.account_box,
                    color: Colors.grey[400],
                  ),
                  Text(' Sahil Kumar Gupta',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Contact us',
                      style: TextStyle(
                        decoration:TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 18,
                        letterSpacing: 2,
                      )
                  ),
                  Text('  -           ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  Text(' g.sahil@iitg.ac.in',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                ],
              ),
          ],

        ),
      ),
    );
  }
}
