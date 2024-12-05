import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/service/auth_service.dart';
import 'package:mtstreamapp/service/service.dart';
// import 'package:mtstreamapp/service/auth_service.dart';
import 'package:mtstreamapp/widgets/bgimage.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mtstreamapp/widgets/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

//statefull widget for login screen
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String? email = '';
  String? password = '';
  bool showspinner = false;
  String? userEmail = '';
  var loading = false;
  bool _isLoggedIn = false;
  Map _userObj = {};
  String? username = '';
  SharedPreferences? prefs;

  login(String username, String email) async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=google_signin');
    var Param = {
      'username': username,
      'email': email,
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

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        print('login failed');
        Fluttertoast.showToast(msg: 'Login Failed');
      }
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Stack(
      //this bgimage is the extract method of background color
      children: [
        BgImage(),
        Scaffold(
          backgroundColor: colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Container(
                      height: 150,
                      child: Center(
                        child: Text(
                          "Dil Do",
                          style: kheading,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 450, left: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            // login();
                            await authClass.googlesignIn(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors.myred,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text(
                                      "Google",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height: 50,
                            width: 350,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: InkWell(
                            onTap: () {
                              FacebookAuth.instance.login(permissions: [
                                "public_profile",
                                "email"
                              ]).then((value) {
                                FacebookAuth.instance
                                    .getUserData()
                                    .then((userData) {
                                  setState(() {
                                    _isLoggedIn = true;
                                    _userObj = userData;
                                    login(
                                      userData['name'],
                                      userData['email'],
                                    );
                                    // login(_userObj.entries.first.value,
                                    //     _userObj[1].value);
                                    // // var data = json.decode(userData.toString());
                                    // // print(data['name']);

                                    Fluttertoast.showToast(
                                        msg: _userObj.entries.first.value);
                                    // FirebaseFirestore.instance
                                    //     .collection("/profile")
                                    //     .doc(FirebaseAuth
                                    //         .instance.currentUser!.uid)
                                    //     .set({
                                    //   "Username": _userObj.entries.first.value
                                    // });
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()));
                                  });
                                });
                              });
                              // _loginwithFacebook();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.myblue,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Icon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        "facebook",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              height: 50,
                              width: 350,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            //this Row for other app thorugh login like whatsapp,twitter,user,etc.
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "learn to login with Whatsapp "),
                                                  Container(
                                                    height: 200,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: colors.mygrey,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Container(
                                                      height: 50,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: colors
                                                              .gradient2pink),
                                                      child: Center(
                                                          child:
                                                              Text('I Know')),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            // login();
                                                            await authClass
                                                                .googlesignIn(
                                                                    context);
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  colors.myred,
                                                              borderRadius:
                                                                  BorderRadiusDirectional
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .google,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            height: 50,
                                                            width: 70,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            FacebookAuth
                                                                .instance
                                                                .login(
                                                                    permissions: [
                                                                  "public_profile",
                                                                  "email"
                                                                ]).then(
                                                                    (value) {
                                                              FacebookAuth
                                                                  .instance
                                                                  .getUserData()
                                                                  .then(
                                                                      (userData) {
                                                                setState(() {
                                                                  _isLoggedIn =
                                                                      true;
                                                                  _userObj =
                                                                      userData;
                                                                  login(
                                                                    userData[
                                                                        'name'],
                                                                    userData[
                                                                        'email'],
                                                                  );
                                                                  // login(_userObj.entries.first.value,
                                                                  //     _userObj[1].value);
                                                                  // // var data = json.decode(userData.toString());
                                                                  // // print(data['name']);

                                                                  Fluttertoast.showToast(
                                                                      msg: _userObj
                                                                          .entries
                                                                          .first
                                                                          .value);
                                                                  // FirebaseFirestore.instance
                                                                  //     .collection("/profile")
                                                                  //     .doc(FirebaseAuth
                                                                  //         .instance.currentUser!.uid)
                                                                  //     .set({
                                                                  //   "Username": _userObj.entries.first.value
                                                                  // });
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              Homepage()));
                                                                });
                                                              });
                                                            });
                                                            // _loginwithFacebook();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  colors.myblue,
                                                              borderRadius:
                                                                  BorderRadiusDirectional
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .facebook,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            height: 50,
                                                            width: 70,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/phonelogin');
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.mobile,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          //this row for login and application privacy policy
                          child: Row(
                            children: [
                              Text(
                                'Login means you are agree our terms',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Text(
                                'terms & privacy policy',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}






















// void _loginwithFacebook() async {
//   setState(() {
//     loading = true;
//   });
//   try {
//     final facebookLoginResult = await FacebookAuth.instance
//         .login(permissions: ["public_profile", "email"]).then((value) async {
//       final userData = await FacebookAuth.instance.getUserData();
//       await FirebaseFirestore.instance.collection('users').add({
//         'email': userData['email'],
//         //'imageUrl': userData['pictures']['data']['url'],
//         'name': userData['name'],
//       });
//     });

//     final facebookAuthcredential =
//         FacebookAuthProvider.credential(facebookLoginResult.accessToken?.token);
//     await FirebaseAuth.instance.signInWithCredential(facebookAuthcredential);

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
//   } on FirebaseAuthException catch (e) {
//     String title = '';
//     switch (e.code) {
//       case 'Account exist different craediantial':
//         title = 'this account exist with diffrent sign in provider';
//         break;
//       case 'invalid credential ':
//         title = 'unknown error has occured';
//         break;
//       case 'user disabled':
//         title = 'the user you tried to login is disbaled';
//         break;
//       case 'user not found':
//         title = 'the user you tried to login is not found';
//         break;
//     }
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text("log in with facebook failed"),
//               content: Text(title),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('okay'))
//               ],
//             ));
//   } finally {
//     setState(() {
//       loading = false;
//     });
//   }
// }










//  Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: colors.whitegrey,
//                                     borderRadius:
//                                         BorderRadiusDirectional.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     controller: emailcontroller,
//                                     keyboardType: TextInputType.emailAddress,
//                                     decoration: InputDecoration(
//                                         hintText: 'EmailID',
//                                         labelText: 'EmailID',
//                                         prefixIcon: Icon(Icons.mail),
//                                         border: OutlineInputBorder()),
//                                     onChanged: (String value) {
//                                       email = value;
//                                     },
//                                     validator: (value) {
//                                       return value!.isEmpty
//                                           ? 'enter mail'
//                                           : null;
//                                     },
//                                   ),
//                                   height: 50,
//                                   width: 350,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 30),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: colors.whitegrey,
//                                     borderRadius:
//                                         BorderRadiusDirectional.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     controller: passwordcontroller,
//                                     keyboardType: TextInputType.emailAddress,
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                         hintText: 'password',
//                                         labelText: 'password',
//                                         prefixIcon: Icon(Icons.lock),
//                                         border: OutlineInputBorder()),
//                                     onChanged: (String value) {
//                                       password = value;
//                                     },
//                                     validator: (value) {
//                                       return value!.isEmpty
//                                           ? 'enter password'
//                                           : null;
//                                     },
//                                   ),
//                                   height: 50,
//                                   width: 350,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () async {
//                                         if (_formKey.currentState!.validate()) {
//                                           setState(() {
//                                             showspinner = true;
//                                           });
//                                           try {
//                                             final user = await _auth
//                                                 .createUserWithEmailAndPassword(
//                                                     email:
//                                                         email.toString().trim(),
//                                                     password: password
//                                                         .toString()
//                                                         .trim());

//                                             if (user != null) {
//                                               print('sucess');
//                                               toastMessages("user succesfull");
//                                               setState(() {
//                                                 showspinner = true;
//                                               });
//                                               Navigator.pushNamed(
//                                                   context, '/home');
//                                             }
//                                           } catch (e) {
//                                             print(e.toString());
//                                             toastMessages(e.toString());
//                                           }
//                                         }
//                                         if (_formKey.currentState!.validate()) {
//                                           setState(() {
//                                             showspinner = true;
//                                           });
//                                           try {
//                                             final user = await _auth
//                                                 .signInWithEmailAndPassword(
//                                                     email:
//                                                         email.toString().trim(),
//                                                     password: password
//                                                         .toString()
//                                                         .trim());

//                                             if (user != null) {
//                                               print('sucess');
//                                               toastMessages("user succesfull");
//                                               setState(() {
//                                                 showspinner = true;
//                                               });
//                                               Navigator.pushNamed(
//                                                   context, '/home');
//                                             }
//                                           } catch (e) {
//                                             print(e.toString());
//                                             toastMessages(e.toString());
//                                           }
//                                         }
//                                       },
//                                       child: Container(
//                                         height: 40,
//                                         width: 350,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(5)),
//                                           border: Border.all(
//                                             color: colors.whitegrey,
//                                             width: 1.5,
//                                           ),
//                                         ),
//                                         child: Center(
//                                             child: Text(
//                                           "Register",
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               color: colors.whitegrey),
//                                         )),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(24.0),
//                                 child: Container(
//                                   //this Row for other app thorugh login like whatsapp,twitter,user,etc.
//                                   child: Row(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 50),
//                                         child: Icon(
//                                           FontAwesomeIcons.whatsapp,
//                                           color: Colors.white,
//                                           size: 35,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 40),
//                                         child: InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(
//                                                 context, '/phonelogin');
//                                           },
//                                           child: Icon(
//                                             FontAwesomeIcons.mobile,
//                                             color: Colors.white,
//                                             size: 35,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 40),
//                                         child: Icon(
//                                           FontAwesomeIcons.twitter,
//                                           color: Colors.white,
//                                           size: 35,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 40),
//                                         child: Icon(
//                                           FontAwesomeIcons.user,
//                                           color: Colors.white,
//                                           size: 35,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 //this row for login and application privacy policy
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       'Login means you are agree our terms',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           color: Colors.white),
//                                     ),
//                                     Text(
//                                       'terms & privacy policy',
//                                       style: TextStyle(
//                                           decoration: TextDecoration.underline,
//                                           fontWeight: FontWeight.w400,
//                                           color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//
// Padding(
//   padding: const EdgeInsets.all(32.0),
//   //this container for login through google
//   child: Container(
//     decoration: BoxDecoration(
//       color: Colors.redAccent,
//       borderRadius: BorderRadiusDirectional.circular(10),
//     ),
//     child: Center(
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 30),
//             child: Icon(
//               FontAwesomeIcons.google,
//               color: Colors.white,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 60),
//             child: Text(
//               "Google",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),

//                      void toastMessages(String message) {
//   Fluttertoast.showToast(
//       msg: message.toString(),
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: colors.myred,
//       textColor: colors.mywhite,
//       fontSize: 16.0);
// }
// Padding(
                            //   padding: const EdgeInsets.only(top: 30),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: colors.whitegrey,
                            //       borderRadius:
                            //           BorderRadiusDirectional.circular(10),
                            //     ),
                            //     child: Center(
                            //       child: Row(
                            //         children: [
                            //           Icon(
                            //             FontAwesomeIcons.google,
                            //             color: Colors.white,
                            //           ),
                            //           Text(
                            //             "Google",
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //               fontSize: 30,  
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     height: 50,
                            //     width: 350,
                            //   ),
                            // ),