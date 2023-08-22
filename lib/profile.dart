import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class profile_scr extends StatefulWidget {
  const profile_scr({super.key});

  @override
  State<profile_scr> createState() => _profile_scrState();
}

class _profile_scrState extends State<profile_scr> {
  Map<String, dynamic> decode = {};

  Map<String, dynamic> mapOfdata = {};

  String mapupdate = '';

  // List<dynamic> listOfdetails = [];
  TextEditingController firstnamecon = TextEditingController();
  TextEditingController lastnamecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController mobilenocon = TextEditingController();
  TextEditingController addresscon = TextEditingController();
  TextEditingController nicknamecon = TextEditingController();
  TextEditingController walletbalencecon = TextEditingController();
  TextEditingController languagecon = TextEditingController();
  TextEditingController groupcon = TextEditingController();
  TextEditingController socitycon = TextEditingController();

  savedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fname', firstnamecon.text);
    await prefs.setString('lname', lastnamecon.text);
    await prefs.setString('nickname', nicknamecon.text);
    await prefs.setString('mobilenumber', mobilenocon.text);
    await prefs.setString('email', emailcon.text);
    await prefs.setString('walletbalance', walletbalencecon.text);
    await prefs.setString('language', languagecon.text);
    await prefs.setString('grouptype', groupcon.text);
    await prefs.setString('socityid', socitycon.text);
    await prefs.setString('address', addresscon.text);
  }

  loadData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.getString(emailcon.text) ?? '';
  }

  bool? isReload;

  String? photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileapicall();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'first name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: firstnamecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Last Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: lastnamecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Nick Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: nicknamecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: mobilenocon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: emailcon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Wallet Balance',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: walletbalencecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Current Language Key',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: languagecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Group Type',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: languagecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Society Id',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: socitycon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: addresscon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        savedata();
                      });
                    },
                    child: Text('save data')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        updateapicall();
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(
                        //         builder: (context) => profile_scr()));
                      });
                    },
                    child: Text('Update Profile')),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  profileapicall() async {
    try {
      final profileurl =
          await 'https://elevenengineers.com/HariOm/public/api/v3/auth/profile/30';
      print('print profile Url ====>>> $profileurl');
      http.Response response;
      response = await http.get(Uri.parse(profileurl));
      if (response.statusCode == 200) {
        print('print statuscode ===>>> ${response.statusCode}');

        var decode = jsonDecode(response.body);
        // mapOfdata = jsonEncode(response.body) as Map<String, dynamic>;
        print('print bodyyyyy ====>>> ${response.body}');
        // listOfdetails = decode['data'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("name", decode["data"]["name"].toString());

        // prefs.setString("token", decode["data"]["auth_token"].toString());
        firstnamecon.text = decode["data"]["f_name"].toString();
        mobilenocon.text = decode["data"]["phone"].toString();
        emailcon.text = decode["data"]["email"].toString();
        // groupcon = decode["data"][0]["gender"].toString() as TextEditingController;
        addresscon.text = decode["data"]["address"].toString();
        socitycon.text = decode["data"]["society_id"].toString();
        languagecon.text = decode["data"]["current_language_key"].toString();
        lastnamecon.text = decode["data"]["l_name"].toString();
        walletbalencecon.text = decode["data"]["wallet_balance"].toString();
        nicknamecon.text = decode["data"]["nick_name"].toString();

        // emailcon.text = mapOfdata['data']['email'].toString();

      } else {
        print('error =====>>>${response.statusCode}');
        print('error =====>>>${response.body}');
      }
    } catch (e) {
      print('exception in today ===>> ${e.toString()}');
    }
  }

  // updateapicall() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var auth_token = prefs.getString("token") ?? "";
  //     var user_id = prefs.getString("id") ?? "";
  //     print("USER ID === ${user_id}");
  //     print("TOKEN ==== $auth_token");
  //     // final body = {
  //     //   'email': emailcon.text.toString(),
  //     // };
  //     // print("BODY === $body");
  //     final Header = {
  //       "auth_token": "Bearer ${auth_token.toString()}",
  //     };
  //     print('headerrrr ======>>>> $Header');
  //
  //     final updateurl =
  //         'https://elevenengineers.com/HariOm/public/api/v3/auth/profileupdate';
  //     print('print updateUrl ====>>> $updateurl');
  //
  //     var request = http.MultipartRequest("POST", Uri.parse(updateurl));
  //
  //     Map<String, String> headers = {
  //       "Authorization": "Bearer ${auth_token.toString()}",
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //     };
  //     request.headers.addAll(headers);
  //     print('MAp headerrrr ======>>>> $headers');
  //
  //     Map<String, String> sendData = {
  //       "email": emailcon.text.trim(),
  //     };
  //
  //     request.fields.addAll(sendData);
  //
  //     print("Send Data === $sendData");
  //     //
  //     http.StreamedResponse streamedResponse = await request.send();
  //     http.Response response = await http.Response.fromStream(streamedResponse);
  //     print("Body ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       print("Status Code === ${response.statusCode}");
  //       var decode = jsonDecode(response.body);
  //       print("Json DECODE=== $decode");
  //       // if (decode['success'] == 1) {
  //         print("DECODE success=== $decode");
  //         profileapicall();
  //       // } else {
  //       //   print("Error in decode success");
  //       // }
  //     } else {
  //       print('error =====>>>${response.statusCode}');
  //       print('error =====>>>${response.body}');
  //     }
  //
  //     // request.headers['auth_token'] = "Bearer ${auth_token.toString()}";
  //     // request.fields["email"] = emailcon.text;
  //     //
  //     // request.send().then((onValue) {
  //     //   print(onValue.statusCode);
  //     //
  //     //   if (onValue.statusCode == 200) {
  //     //     print("ONVALUE ==== ${onValue.statusCode.toString()}");
  //     //     profileapicall();
  //     //     print("After onvalue ==== >");
  //     //   } else {
  //     //     setState(() {
  //     //       isReload = false;
  //     //     });
  //     //     print("Error ==== ${onValue.statusCode.toString()}");
  //     //   }
  //     //   // print("print == ${onValue.toString()}");
  //     //   // print("HEADER  ${onValue.headers}");
  //     //   // print(onValue.contentLength);
  //     //   print("StatusCode ==== ${onValue.statusCode.toString()}");
  //     // });
  //   } catch (e) {
  //     print('to days exception is ======>>>>> ${e.toString()}');
  //   }
  // }

  updateapicall() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var auth_token = prefs.getString("token") ?? "";
      var user_id = prefs.getString("id") ?? "";
      print("USER ID === ${user_id}");
      print("TOKEN ==== $auth_token");

      final Header = {
        "auth_token": "Bearer ${auth_token.toString()}",
      };
      print('headerrrr ======>>>> $Header');

      final updateurl =
          'https://elevenengineers.com/HariOm/public/api/v3/auth/profileupdate';
      print('print updateUrl ====>>> $updateurl');

      var response = await http.post(Uri.parse(updateurl), headers: Header);
      if (response.statusCode == 200) {
        print("Status Code ==== ${response.statusCode}");
        var decode = jsonDecode(response.body);
        print("Decode body === $decode");
        if (decode['success'] == 1) {
          profileapicall();
          print("Decode success $decode");
        } else {
          print("Error in decode success");
        }
      } else {
        print("Error === ${response.statusCode.toString()}");
        print("Error === ${response.body.toString()}");
      }
    } catch (e) {
      print('to days exception is ======>>>>> ${e.toString()}');
    }
  }
}
