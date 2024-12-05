import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mtstreamapp/Screens/login/login.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isLoggedIn = false;
  Map _userObj = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Security',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Room Effects',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Inbox',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Language',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'App Alerts',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Clear Cache',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Text(
                      '91 M',
                      style: TextStyle(color: colors.mygrey),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Review US !',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Facebook',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'FAQ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'FAQ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'Current Version 0.0.0',
                    style: TextStyle(color: colors.mygrey),
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Connect With Us',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: CircleAvatar(
                        maxRadius: 5,
                        backgroundColor: colors.myred,
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: colors.mybluegrey,
            child: Container(
              height: 50,
              width: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'About Us',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.mygrey,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              auth.signOut();
              GoogleSignIn().disconnect();
              FacebookAuth.instance.logOut().then((value) {
                setState(() {
                  _isLoggedIn = false;
                  _userObj = {};
                });
              });

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Card(
              shadowColor: colors.mybluegrey,
              child: Container(
                height: 50,
                width: 420,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log Out',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
