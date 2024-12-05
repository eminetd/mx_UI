import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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

  int bean = 0;
  int diamonds = 0;
  late Razorpay _razorpay;
  void openCheckout(
    int amt,
  ) async {
    var options = {
      'key': 'rzp_test_mwVqforrK23LnD',
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
    Fluttertoast.showToast(msg: 'Payment Succesfull');
    FirebaseFirestore.instance
        .collection('/beans')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      FirebaseFirestore.instance
          .collection('/beans')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "beans": value["beans"] + bean,
        // "diamond": value['diamond']+ diamonds,
      });
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
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Text(
                  'Account ID : ',
                  style: TextStyle(color: colors.mygrey),
                ),
                Text('username')
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '3500',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+2,300',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 3500 + 2300;
                openCheckout(80);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 80',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '17,500',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+11,500',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 17500 + 11500;
                openCheckout(410);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 410',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '35,500',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+23,000',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 35500 + 23500;
                openCheckout(820);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 820',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '70,000',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+46,000',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 70000 + 46000;
                openCheckout(1650);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 1,650',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '1,75,000',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+1,15,000',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 175000 + 115000;
                openCheckout(4100);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 4,100',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '3,50,000',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+2,30,000',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 375000 + 230000;
                openCheckout(8200);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 8,200',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/diamond.png"),
            title: Row(
              children: [
                Text(
                  '5,25,000',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+3,45,000',
                  style: TextStyle(fontSize: 20, color: colors.orange2),
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                bean = 525000 + 345000;
                openCheckout(12300);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.gradient2pink,
                ),
                child: Center(
                  child: Text(
                    'INR 12,300',
                    style: TextStyle(fontSize: 20, color: colors.mywhite),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
