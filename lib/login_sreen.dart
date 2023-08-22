import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/profile.dart';
class login_scr extends StatefulWidget {
  const login_scr({super.key});

  @override
  State<login_scr> createState() => _login_scrState();
}

class _login_scrState extends State<login_scr> {



   TextEditingController phonecontroller = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextFormField(
                controller: phonecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2)),
                  hintText: 'enter your mobile number',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2)),
                  hintText: 'enter your Password',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextButton(
                onPressed: (){
                  setState(() {
                    LoginApi();
                  });
                },
                  child: Text('submit'),
              ),
            )
          ],
        ),
      ),
    ));
  }


  LoginApi() async {

    try {
      final body = {
        "phone": phonecontroller.text.toString(),
        "password": passwordcontroller.text.toString(),
      };

      final loginurl =  'https://elevenengineers.com/HariOm/public/api/v3/auth/users/login?phone=1111111111&password=123456';

      var response = await http.post(Uri.parse(loginurl), body: body);

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);


          // print("registration$decode");

          //  MakePaymentAPIcall();

          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.setString('id', decode['user_id'].toString());
          sharedPreferences.setString(
              "token", decode["token"].toString());

Navigator.push(context, MaterialPageRoute(builder: (context) => profile_scr()));




      } else {
        print("Error" + response.statusCode.toString());
        print("Error" + response.body.toString());
      }
    } catch (e) {

      print("Exception in Today Attendance=>" + e.toString());
      throw e;
    }
  }
}


