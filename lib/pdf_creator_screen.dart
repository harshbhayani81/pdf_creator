import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class pdfcreator extends StatefulWidget {
  const pdfcreator({super.key});

  @override
  State<pdfcreator> createState() => _pdfcreatorState();
}

class _pdfcreatorState extends State<pdfcreator> {
  Map mapOfData = {};
  // <String, Map<String, dynamic >>
  List<dynamic> listOfData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileapi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Create Pdf'),
          ),
          body: PdfPreview(
            build: (context) => makePdf(),
          ),
        ));
  }

  Future<Uint8List> makePdf() async {
    final pdf = pw.Document();
    // final ByteData bytes = await rootBundle.load('assets/cELLS-01.png');
    // final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(pw.Page(
        margin: const pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Header(text: "User Data", level: 1),
                      // pw.Image(pw.MemoryImage(byteList),
                      //     fit: pw.BoxFit.fitHeight, height: 100, width: 100)
                    ]),
                pw.Divider(borderStyle: pw.BorderStyle.dashed),


                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('id :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['id'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('First Name :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['f_name'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Last Name :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['l_name'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Nick Name :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['nick_name'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Phone :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['phone'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('alt Phone :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['alt_phone'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Email :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['email'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Email Verified At :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['email_verified_at'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Creted At :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['created_at'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Updated At :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['updated_at'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Status :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['status'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Wallet Balance :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['wallet_balance'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Current Language Key :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['current_language_key'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Delivery Man Id :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['delivery_man_id'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Added By :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['added_by'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Contect Permission :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['contact_permission'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Group Type :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['group_type'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('User Type :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['user_type'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Order Count :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['order_count'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Forget Password OTP :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['forget_password_otp'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Socity Id :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['society_id'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Address :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['address'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Milk Price :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['milkPrice'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Item Name :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['itemName'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Deliveryman Number :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['deliveryman_no'].toString())
                      ),
                    ]
                ),
                pw.Row(

                    children: [
                      pw.Container(
                          child: pw.Text('Remain Balance :')
                      ),
                      pw.SizedBox(
                          width: 20
                      ),
                      pw.Container(
                          child: pw.Text(mapOfData['data']['remain_bal'].toString())
                      ),
                    ]
                ),
              ]);
        }));
    return pdf.save();
  }

  profileapi() async {
    try {
      final profileurl =
      await 'https://elevenengineers.com/HariOm/public/api/v3/auth/profile/30';
      print('print profile Url ====>>> $profileurl');
      http.Response response;
      response = await http.get(Uri.parse(profileurl));
      if (response.statusCode == 200) {
        print('print statuscode ===>>> ${response.statusCode}');

        mapOfData = jsonDecode(response.body);
        print('print bodyyyyy ====>>> ${response.body}');
        listOfData = mapOfData['data'];

      } else {
        print('error =====>>>${response.statusCode}');
      }
    } catch (e) {
      print('exception in today ===>> ${e.toString()}');
    }
  }
}
