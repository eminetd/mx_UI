import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtstreamapp/widgets/color.dart';

class OfficialTalent extends StatefulWidget {
  const OfficialTalent({Key? key}) : super(key: key);

  @override
  State<OfficialTalent> createState() => _OfficialTalentState();
}

class _OfficialTalentState extends State<OfficialTalent> {
  var Radioval;
  var groupvalue;
  File? image = null;
  Future pickImage(ImageSource source) async {
    try {
      final Image = await ImagePicker().pickImage(source: source);
      if (Image == null) return;

      image = File(Image.path);
      // final imagePermanent = await saveImagePermanent(image!.path);
      setState(() {});
    } on PlatformException catch (e) {
      print('failed to pick image:$e');
    }
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController nidcontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Official Talent',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              keyboardType: TextInputType.emailAddress,
              cursorColor: colors.gradient2pink,
              decoration: InputDecoration(
                labelText: '* Enter your real Name',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: phonecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your mobile no. ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270, top: 10),
              child: Text(
                '* Select Your Country Region : ',
                style: TextStyle(color: colors.myblack),
              ),
            ),
            Card(
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('India'),
                    ),
                    Icon(Icons.forward),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270, top: 10),
              child: Text(
                '* Please Select your State : ',
                style: TextStyle(color: colors.myblack),
              ),
            ),
            Card(
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('India'),
                    ),
                    Icon(Icons.forward),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: addresscontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email address(optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: nidcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter your national ID no.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Choose From'),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera);
                                    },
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  image = null;
                                  Navigator.pop(context);
                                  pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Icon(
                                        Icons.collections_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: Text(
                                        'Gallery',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 180,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.mygrey)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 60),
                    child: Column(
                      children: [
                        Icon(Icons.add),
                        Text('Click To upload national ID image')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Choose From'),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera);
                                    },
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  image = null;
                                  Navigator.pop(context);
                                  pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Icon(
                                        Icons.collections_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: Text(
                                        'Gallery',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 180,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.mygrey)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 60),
                    child: Column(
                      children: [
                        Icon(Icons.add),
                        Text('Upload a photo of Yourself holding ID card')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Choose From'),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera);
                                    },
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  image = null;
                                  Navigator.pop(context);
                                  pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Icon(
                                        Icons.collections_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: Text(
                                        'Gallery',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 180,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.mygrey)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 60),
                    child: Column(
                      children: [Icon(Icons.add), Text('Upload self - taken')],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 20),
              child: Text('Choose how you want to be Paid'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 20),
              child: Text('*Select Payment Receival Type : '),
            ),
            Row(
              children: [
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Self',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Self'),
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Via Agency',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Via Agency'),
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Trusted 3rd Party',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Trusted 3rd Party'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 20),
              child: Text('*Select Payment Method '),
            ),
            Row(
              children: [
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Cash',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Cash'),
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Bank',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Bank'),
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'Paypal',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('Paypal')
              ],
            ),
            Row(
              children: [
                Radio<String>(
                    activeColor: colors.gradient2pink,
                    value: 'I want to join StreamKar agency',
                    groupValue: groupvalue,
                    onChanged: (value) {
                      setState(() {
                        groupvalue = value;
                      });
                    }),
                Text('I want to join StreamKar agency'),
              ],
            ),
            TextFormField(
              controller: idcontroller,
              cursorColor: colors.gradient2pink,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'home ',
                hintText: 'Enter agency ID',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.gradient2pink),
                  child: Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(fontSize: 25, color: colors.mywhite),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
