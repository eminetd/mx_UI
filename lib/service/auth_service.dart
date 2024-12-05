import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthClass {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  SharedPreferences? prefs;
  login(String username, String email, BuildContext context,
      String? image_path) async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=google_signin');
    var Param = {
      'username': username,
      'email': email,
      'image_path': image_path,
    };
    var response = await post(url, body: Param);
    final data = json.decode(response.body);

    print(data);

    if (response.statusCode == 200) {
      if (data['STATUS'] == '1') {
        print('success');
        print(data['NAME']);
        var user_email = data['USERID'];
        print(user_email);
        prefs = await SharedPreferences.getInstance();
        prefs?.setString('USERID', data['USERID'].toString());
        prefs?.setString(
          'username',
          data['NAME'].toString(),
        );
        prefs?.setString('email', data['EMAIL'].toString());
        prefs?.setString('image_path', data['PROFILE_PIC'].toString());
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        print('login failed');
        Fluttertoast.showToast(msg: 'Login Failed');
      }
    }
  }

  Future<void> googlesignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          login(
              FirebaseAuth.instance.currentUser!.displayName.toString(),
              FirebaseAuth.instance.currentUser!.email.toString(),
              context,
              FirebaseAuth.instance.currentUser!.photoURL);
          FirebaseFirestore.instance
              .collection('/Usernames')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set({
            'username': FirebaseAuth.instance.currentUser?.displayName,
            'pimage': FirebaseAuth.instance.currentUser?.photoURL,
          });

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => Homepage()),
              (route) => false);
        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        final snackBar = SnackBar(content: Text('Not able to Sign In'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
