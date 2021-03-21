import 'dart:convert';
import 'dart:io';

import 'package:cashfree/cashfree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage2.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage5.dart';
import 'package:telepeapp/NavBar/NavBar.dart';
import 'package:telepeapp/colors.dart';
import 'package:http/http.dart' as http;

import '../token_provider.dart';

class ApplicationPage4 extends StatefulWidget {
  ApplicationPage4({Key key, this.applicationData}) : super(key: key);
  //final int applicationnumber;
  final Map<String, dynamic> applicationData;
  @override
  _ApplicationPage4State createState() => _ApplicationPage4State();
}

class _ApplicationPage4State extends State<ApplicationPage4> {
  final Cashfree _cashfree = Cashfree();
  List<String> documentURLs = List<String>();
  String name;
  String bankName;
  String accountNumber;
  String ifscCode;
  String branchLocation;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
//  final HttpsCallable callable = CloudFunctions.instance
//      .getHttpsCallable(functionName: 'widgets')
//        ..timeout = const Duration(seconds: 30);
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://telepe-f122e.appspot.com');
  StorageUploadTask _uploadTask;
  StorageReference ref;
  @override
  void initState() {
    _cashfree.on(Cashfree.EVENT_PAYMENT_SUCCESS, _handleCashfreePaymentSuccess);
    _cashfree.on(Cashfree.EVENT_PAYMENT_ERROR, _handleCashfreePaymentError);
    _cashfree.on(Cashfree.EVENT_ERROR, _handleCashfreeError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/teelpe22.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/teelpe15.png",
                          height: 75,
                          width: 75,
                        ),
                      ],
                    ),
                    Text(
                      "Application Form",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: blueColor),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: blueColor,
                              height: 2,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: blueColor),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: blueColor,
                              height: 2,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: blueColor),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: blueColor,
                              height: 2,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: yellowColor),
                            child: Center(
                              child: Text("4"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: greyColor,
                              height: 2,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: greyColor),
                            child: Center(
                              child: Text("5"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Personal",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text("Income",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text("Loan\nSelect",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text("Verify\nAccount",
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text("Get Loan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Fill all correct details for loan amount received"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          maxLines: 2,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "  Full Name(As per Bank)",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              bankName = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "  Bank Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              accountNumber = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "  Account Number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              ifscCode = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "  IFSC Code",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              branchLocation = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "  Branch Location",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                _getDialog();
                              }
                            },
                            child: Text(
                              "Verify and Submit",
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: yellowColor,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Dear $name"),
            content: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
//                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/1w.png", fit: BoxFit.cover),
                ),
                Wrap(
                  children: [
                    Text(
                      "Kindly Pay \u20b925 for validating the account.\n(This Amount is Refundable as per Loan Status, so don't worry)\nValidate and Continue for Processing Loan.",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.width / 28),
                    )
                  ],
                )
              ],
            ),
            actions: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "OK",
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please wait!"),));
                  initiatePayment();
//                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>ApplicationPage5(applicationNumber: widget
//                                     .applicationData['applicationnumber'],
//                                  name: name,appData: widget.applicationData,docs: widget.applicationData['documents'],)));
                },
                color: yellowColor,
              )
            ],
          );
        });
  }

  uploadApplicationDetails(
      String refID, String paymentMode, String orderId) async {
    var pushToken = await FirebaseMessaging().getToken();
    var info = widget.applicationData;
    info['fullname_bank'] = name;
    info['bank_name'] = bankName;
    info['ifsc_code'] = ifscCode;
    info['account_number'] = accountNumber;
    info['branch_location'] = branchLocation;
    info['pushToken'] = pushToken;
    info['loan_application_status'] = "Submitted Documents";
    info["referenceId1"] = refID;
    info["paymentMode1"] = paymentMode;
    info["orderId1"] = orderId;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return getSuccessDialog(info);
        });
  }

  initiatePayment() async {
    String orderId=DateTime.now().millisecondsSinceEpoch.toString();
    String token = await cashFreeToken()
        .getToken(orderId, 25);
    var options = {
      'token': token,
      'stage': "PROD",
      'appId': "57663ad830b5854b39d3205f136675",
      'orderId': orderId,
      'orderAmount': 25,
      'orderNote': "TestNote",
      'orderCurrency': "INR",
      'customerName': name,
      'customerPhone': widget.applicationData['mobilenum'],
      'customerEmail': widget.applicationData['emailid'],
      'notifyUrl': '',
      "paymentModes": ''
    };
    _cashfree.doPayment(options);
  }

  void _handleCashfreePaymentSuccess(
      CashfreePaymentSuccessResponse response) async {
    print("Cashfree payment success orderId:${response.orderId}");
    uploadApplicationDetails(
        response.referenceId, response.paymentMode, response.orderId);
  }

  void _handleCashfreePaymentError(
      CashfreePaymentFailureResponse response) async {
    print(
        "Cashfree payment error msg:${response.txMsg}, status: ${response.txStatus}");
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Something Went Wrong.\n${response.txMsg},Status: \n${response.txStatus}"),
          );
        });
  }

  void _handleCashfreeError(CashfreeError cashfreeError) async {
    print("Cashfree error:${cashfreeError.message}");
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text("Payment Error!\n${cashfreeError.message}"),
          );
        });
  }

  getSuccessDialog(Map<String,dynamic> appData) {
    print(appData['documents']);
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/llno.png"), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Dear ${widget.applicationData['fullname']}",
                            ),
                            Text(
                              "Congratulations!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: blueColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Your Account Number has been verified. Please complete next details and submit."),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Thanks",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blueColor,
                          fontSize: 18),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: blueColor, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
//                      Navigator.pushAndRemoveUntil(
//                          context,
//                          CupertinoPageRoute(
//                              builder: (context) => ApplicationPage5(
//                                    applicationNumber: widget
//                                        .applicationData['applicationnumber'],
//                                    name: name,appData: appData,docs: appData['documents'],
//                                  )),
//                          (route) => false);
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>ApplicationPage5(applicationNumber: widget
                                     .applicationData['applicationnumber'],
                                  name: name,appData: appData,)));
                    },
                    color: yellowColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
