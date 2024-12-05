import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddStatus extends StatefulWidget {
  final String image;
  const AddStatus({Key? key, required this.image}) : super(key: key);

  @override
  State<AddStatus> createState() => _AddStatusState();
}

class _AddStatusState extends State<AddStatus> {
  String userid = '';
  TextEditingController captioncontroller = TextEditingController();
  File? image;

  late SharedPreferences preferences;
  getuserid() async {
    preferences = await SharedPreferences.getInstance();
  }

  addpost() async {
    userid = await preferences.getString('USERID').toString();
    print(widget.image);
    var request = MultipartRequest(
        'POST', Uri.parse(baseURL + 'all_apis.php?func=add_post'));
    request.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
    });
    request.fields['userid'] = '3';
    request.fields['caption'] = captioncontroller.text;
    request.files.add(await MultipartFile.fromPath('image', widget.image));
    var response = await request.send();
    if (response.statusCode == 200) {
      Response res = await Response.fromStream(response);
      Map<String, dynamic> result = jsonDecode(res.body);
      print('${result["message"]}');
      Fluttertoast.showToast(msg: '${result["message"]}');
    }
  }

  @override
  void initState() {
    getuserid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Status',
              style: TextStyle(color: colors.myblack),
            ),
            InkWell(
              onTap: () {
                addpost();
                Navigator.pop(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: colors.myblack),
              ),
            ),
          ],
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: 400,
            child: TextField(
              controller: captioncontroller,
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: InputDecoration(hintText: 'Want to share a Status'),
            ),
          ),
          Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors.mygrey,
              ),
              child: Image.file(
                File(
                  (widget.image.toString()),
                ),
                fit: BoxFit.cover,
              )),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/topic');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('# Topic'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text('Add or Create Topic'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
