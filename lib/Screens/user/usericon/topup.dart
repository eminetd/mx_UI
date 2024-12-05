import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class TopUP extends StatefulWidget {
  const TopUP({Key? key}) : super(key: key);

  @override
  State<TopUP> createState() => _TopUPState();
}

class _TopUPState extends State<TopUP> {
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  late Razorpay _razorpay;
  void openCheckout(int amt) async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100 * amt,
      'name': 'Mt stream',
      'description': 'Coins',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8381067879', 'email': 'nikhilfengse14@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    FirebaseFirestore.instance
        .collection('/beans')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "beans": 10,
      "diamond": 5,
    });

    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  colors.gradient1purple,

                  colors.gradient2pink,

                  // colors.gradient1purple,
                ])),
                height: 250,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Top - Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: colors.mywhite),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Record',
                              style: TextStyle(
                                  fontSize: 20, color: colors.mywhite2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Available Beans : 0',
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              child: Container(
                height: 160,
                width: 700,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  colors.gradient1purple,
                  colors.gradient2pink,
                  colors.gradient2pink,
                  colors.gradient1purple,
                ])),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 140),
                      child: Text(
                        "Special offers",
                        style: TextStyle(fontSize: 30, color: colors.mywhite),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/cars.png",
                              height: 100,
                              width: 100,
                            ),
                            Image.asset(
                              "assets/vipbadge.png",
                              height: 100,
                              width: 100,
                            ),
                            Image.asset(
                              "assets/crystalshoe.png",
                              height: 100,
                              width: 100,
                            ),
                            Image.asset(
                              "assets/fireworks.png",
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Account ID :',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Acc. Name',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            'Gift to Friend',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Top Up Methods:',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'INDIA',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 195),
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    openCheckout(10);
                  },
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Upi',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'RazorPay',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 195),
                            child: Container(
                              height: 20,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colors.orange2,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      FontAwesomeIcons.rankingStar,
                                      size: 18,
                                      color: colors.mywhite,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Bonus',
                                      style: TextStyle(
                                          fontSize: 15, color: colors.mywhite),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 180),
                          //   child: Icon(
                          //     Icons.arrow_forward_ios,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/pay');
              },
              child: Card(
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Upi',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'RazorPay',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 195),
                        child: Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colors.orange2,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  FontAwesomeIcons.rankingStar,
                                  size: 18,
                                  color: colors.mywhite,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Bonus',
                                  style: TextStyle(
                                      fontSize: 15, color: colors.mywhite),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 180),
                      //   child: Icon(
                      //     Icons.arrow_forward_ios,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //     padding: const EdgeInsets.only(top: 580),
            //     child: Card(
            //       child: Container(
            //         height: 60,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 5),
            //               child: Text(
            //                 'Paytm',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Paytm Upi',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 195),
            //               child: Container(
            //                 height: 20,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: colors.orange2,
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Icon(
            //                         FontAwesomeIcons.rankingStar,
            //                         size: 18,
            //                         color: colors.mywhite,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Text(
            //                         'Bonus',
            //                         style: TextStyle(
            //                             fontSize: 15, color: colors.mywhite),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 180),
            //             //   child: Icon(
            //             //     Icons.arrow_forward_ios,
            //             //   ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     )),
            // Padding(
            //     padding: const EdgeInsets.only(top: 630),
            //     child: Card(
            //       child: Container(
            //         height: 60,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 5),
            //               child: Text(
            //                 'Paytm',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Paytm Upi',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 195),
            //               child: Container(
            //                 height: 20,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: colors.orange2,
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Icon(
            //                         FontAwesomeIcons.rankingStar,
            //                         size: 18,
            //                         color: colors.mywhite,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Text(
            //                         'Bonus',
            //                         style: TextStyle(
            //                             fontSize: 15, color: colors.mywhite),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 180),
            //             //   child: Icon(
            //             //     Icons.arrow_forward_ios,
            //             //   ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     )),
            // Padding(
            //     padding: const EdgeInsets.only(top: 680),
            //     child: Card(
            //       child: Container(
            //         height: 60,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 5),
            //               child: Text(
            //                 'Paytm',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Paytm Upi',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 195),
            //               child: Container(
            //                 height: 20,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: colors.orange2,
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Icon(
            //                         FontAwesomeIcons.rankingStar,
            //                         size: 18,
            //                         color: colors.mywhite,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Text(
            //                         'Bonus',
            //                         style: TextStyle(
            //                             fontSize: 15, color: colors.mywhite),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 180),
            //             //   child: Icon(
            //             //     Icons.arrow_forward_ios,
            //             //   ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     )),
            // Padding(
            //     padding: const EdgeInsets.only(top: 730),
            //     child: Card(
            //       child: Container(
            //         height: 60,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 5),
            //               child: Text(
            //                 'Paytm',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Paytm Upi',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 195),
            //               child: Container(
            //                 height: 20,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: colors.orange2,
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Icon(
            //                         FontAwesomeIcons.rankingStar,
            //                         size: 18,
            //                         color: colors.mywhite,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Text(
            //                         'Bonus',
            //                         style: TextStyle(
            //                             fontSize: 15, color: colors.mywhite),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 180),
            //             //   child: Icon(
            //             //     Icons.arrow_forward_ios,
            //             //   ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     )),
            // Padding(
            //     padding: const EdgeInsets.only(top: 780),
            //     child: Card(
            //       child: Container(
            //         height: 60,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 5),
            //               child: Text(
            //                 'Paytm',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Paytm Upi',
            //                 style: TextStyle(fontSize: 17),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 195),
            //               child: Container(
            //                 height: 20,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: colors.orange2,
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Icon(
            //                         FontAwesomeIcons.rankingStar,
            //                         size: 18,
            //                         color: colors.mywhite,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 5),
            //                       child: Text(
            //                         'Bonus',
            //                         style: TextStyle(
            //                             fontSize: 15, color: colors.mywhite),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 180),
            //             //   child: Icon(
            //             //     Icons.arrow_forward_ios,
            //             //   ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:mtstreamapp/widgets/color.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class TopUP extends StatefulWidget {
//   const TopUP({Key? key}) : super(key: key);

//   @override
//   State<TopUP> createState() => _TopUPState();
// }

// class _TopUPState extends State<TopUP> {
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   late Razorpay _razorpay;
//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_live_ILgsfZCZoFIKMb',
//       'amount': 100,
//       'name': 'Mt stream',
//       'description': 'Coins',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8381067879', 'email': 'nikhilfengse14@gmail.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print('Success Response: $response');
//     /*Fluttertoast.showToast(
//         msg: "SUCCESS: " + response.paymentId!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('Error Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " + response.message!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print('External SDK Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 colors.gradient1purple,
//                 colors.gradient1purple,
//                 colors.gradient2pink,
//                 colors.gradient2pink,
//                 colors.gradient1purple,
//               ])),
//               height: 250,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             'Top - Up',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: colors.mywhite),
//                           ),
//                         ),
//                         Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: Text(
//                             'Record',
//                             style:
//                                 TextStyle(fontSize: 20, color: colors.mywhite2),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 180),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Available Beans : 0',
//                           style: TextStyle(fontSize: 20, color: colors.mywhite),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               )),
//           Padding(
//             padding: const EdgeInsets.only(top: 250),
//             child: Card(
//               child: Container(
//                 height: 160,
//                 width: 700,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                   colors.gradient1purple,
//                   colors.gradient1purple,
//                   colors.gradient2pink,
//                   colors.gradient2pink,
//                   colors.gradient1purple,
//                 ])),
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 140),
//                       child: Text(
//                         "Special offers",
//                         style: TextStyle(fontSize: 30, color: colors.mywhite),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 50),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "assets/cars.png",
//                               height: 100,
//                               width: 100,
//                             ),
//                             Image.asset(
//                               "assets/vipbadge.png",
//                               height: 100,
//                               width: 100,
//                             ),
//                             Image.asset(
//                               "assets/crystalshoe.png",
//                               height: 100,
//                               width: 100,
//                             ),
//                             Image.asset(
//                               "assets/fireworks.png",
//                               height: 100,
//                               width: 100,
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.only(top: 420),
//               child: Card(
//                 child: Container(
//                   height: 60,
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Text(
//                           'Account ID :',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           'Acc. Name',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 100),
//                         child: Text(
//                           'Gift to Friend',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Icon(
//                           Icons.arrow_forward_ios,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )),
//           Padding(
//               padding: const EdgeInsets.only(top: 480),
//               child: Card(
//                 child: Container(
//                   height: 60,
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Text(
//                           'Top Up Methods:',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           'INDIA',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 195),
//                         child: Icon(
//                           Icons.arrow_forward_ios,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//           Padding(
//               padding: const EdgeInsets.only(top: 530),
//               child: InkWell(
//                 onTap: () {
//                   openCheckout();
//                 },
//                 child: Card(
//                   child: Container(
//                     height: 60,
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Text(
//                             'Upi',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             'RazorPay',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 195),
//                           child: Container(
//                             height: 20,
//                             width: 70,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: colors.orange2,
//                             ),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5),
//                                   child: Icon(
//                                     FontAwesomeIcons.rankingStar,
//                                     size: 18,
//                                     color: colors.mywhite,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5),
//                                   child: Text(
//                                     'Bonus',
//                                     style: TextStyle(
//                                         fontSize: 15, color: colors.mywhite),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 180),
//                         //   child: Icon(
//                         //     Icons.arrow_forward_ios,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )),
//           // Padding(
//           //     padding: const EdgeInsets.only(top: 580),
//           //     child: Card(
//           //       child: Container(
//           //         height: 60,
//           //         child: Row(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 5),
//           //               child: Text(
//           //                 'Paytm',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 10),
//           //               child: Text(
//           //                 'Paytm Upi',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 195),
//           //               child: Container(
//           //                 height: 20,
//           //                 width: 70,
//           //                 decoration: BoxDecoration(
//           //                   borderRadius: BorderRadius.circular(20),
//           //                   color: colors.orange2,
//           //                 ),
//           //                 child: Row(
//           //                   children: [
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Icon(
//           //                         FontAwesomeIcons.rankingStar,
//           //                         size: 18,
//           //                         color: colors.mywhite,
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Text(
//           //                         'Bonus',
//           //                         style: TextStyle(
//           //                             fontSize: 15, color: colors.mywhite),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ),
//           //             ),
//           //             // Padding(
//           //             //   padding: const EdgeInsets.only(left: 180),
//           //             //   child: Icon(
//           //             //     Icons.arrow_forward_ios,
//           //             //   ),
//           //             // ),
//           //           ],
//           //         ),
//           //       ),
//           //     )),
//           // Padding(
//           //     padding: const EdgeInsets.only(top: 630),
//           //     child: Card(
//           //       child: Container(
//           //         height: 60,
//           //         child: Row(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 5),
//           //               child: Text(
//           //                 'Paytm',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 10),
//           //               child: Text(
//           //                 'Paytm Upi',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 195),
//           //               child: Container(
//           //                 height: 20,
//           //                 width: 70,
//           //                 decoration: BoxDecoration(
//           //                   borderRadius: BorderRadius.circular(20),
//           //                   color: colors.orange2,
//           //                 ),
//           //                 child: Row(
//           //                   children: [
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Icon(
//           //                         FontAwesomeIcons.rankingStar,
//           //                         size: 18,
//           //                         color: colors.mywhite,
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Text(
//           //                         'Bonus',
//           //                         style: TextStyle(
//           //                             fontSize: 15, color: colors.mywhite),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ),
//           //             ),
//           //             // Padding(
//           //             //   padding: const EdgeInsets.only(left: 180),
//           //             //   child: Icon(
//           //             //     Icons.arrow_forward_ios,
//           //             //   ),
//           //             // ),
//           //           ],
//           //         ),
//           //       ),
//           //     )),
//           // Padding(
//           //     padding: const EdgeInsets.only(top: 680),
//           //     child: Card(
//           //       child: Container(
//           //         height: 60,
//           //         child: Row(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 5),
//           //               child: Text(
//           //                 'Paytm',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 10),
//           //               child: Text(
//           //                 'Paytm Upi',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 195),
//           //               child: Container(
//           //                 height: 20,
//           //                 width: 70,
//           //                 decoration: BoxDecoration(
//           //                   borderRadius: BorderRadius.circular(20),
//           //                   color: colors.orange2,
//           //                 ),
//           //                 child: Row(
//           //                   children: [
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Icon(
//           //                         FontAwesomeIcons.rankingStar,
//           //                         size: 18,
//           //                         color: colors.mywhite,
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Text(
//           //                         'Bonus',
//           //                         style: TextStyle(
//           //                             fontSize: 15, color: colors.mywhite),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ),
//           //             ),
//           //             // Padding(
//           //             //   padding: const EdgeInsets.only(left: 180),
//           //             //   child: Icon(
//           //             //     Icons.arrow_forward_ios,
//           //             //   ),
//           //             // ),
//           //           ],
//           //         ),
//           //       ),
//           //     )),
//           // Padding(
//           //     padding: const EdgeInsets.only(top: 730),
//           //     child: Card(
//           //       child: Container(
//           //         height: 60,
//           //         child: Row(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 5),
//           //               child: Text(
//           //                 'Paytm',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 10),
//           //               child: Text(
//           //                 'Paytm Upi',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 195),
//           //               child: Container(
//           //                 height: 20,
//           //                 width: 70,
//           //                 decoration: BoxDecoration(
//           //                   borderRadius: BorderRadius.circular(20),
//           //                   color: colors.orange2,
//           //                 ),
//           //                 child: Row(
//           //                   children: [
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Icon(
//           //                         FontAwesomeIcons.rankingStar,
//           //                         size: 18,
//           //                         color: colors.mywhite,
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Text(
//           //                         'Bonus',
//           //                         style: TextStyle(
//           //                             fontSize: 15, color: colors.mywhite),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ),
//           //             ),
//           //             // Padding(
//           //             //   padding: const EdgeInsets.only(left: 180),
//           //             //   child: Icon(
//           //             //     Icons.arrow_forward_ios,
//           //             //   ),
//           //             // ),
//           //           ],
//           //         ),
//           //       ),
//           //     )),
//           // Padding(
//           //     padding: const EdgeInsets.only(top: 780),
//           //     child: Card(
//           //       child: Container(
//           //         height: 60,
//           //         child: Row(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 5),
//           //               child: Text(
//           //                 'Paytm',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 10),
//           //               child: Text(
//           //                 'Paytm Upi',
//           //                 style: TextStyle(fontSize: 17),
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.only(left: 195),
//           //               child: Container(
//           //                 height: 20,
//           //                 width: 70,
//           //                 decoration: BoxDecoration(
//           //                   borderRadius: BorderRadius.circular(20),
//           //                   color: colors.orange2,
//           //                 ),
//           //                 child: Row(
//           //                   children: [
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Icon(
//           //                         FontAwesomeIcons.rankingStar,
//           //                         size: 18,
//           //                         color: colors.mywhite,
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: const EdgeInsets.only(left: 5),
//           //                       child: Text(
//           //                         'Bonus',
//           //                         style: TextStyle(
//           //                             fontSize: 15, color: colors.mywhite),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ),
//           //             ),
//           //             // Padding(
//           //             //   padding: const EdgeInsets.only(left: 180),
//           //             //   child: Icon(
//           //             //     Icons.arrow_forward_ios,
//           //             //   ),
//           //             // ),
//           //           ],
//           //         ),
//           //       ),
//           //     )),
//         ],
//       ),
//     );
//   }
// }
