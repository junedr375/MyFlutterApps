import 'dart:io';

import 'package:cashfree/cashfree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telepeapp/NavBar/NavBar.dart';
import 'package:telepeapp/colors.dart';

import '../token_provider.dart';

class ApplicationPage5 extends StatefulWidget {
  ApplicationPage5(
      {Key key, this.applicationNumber, this.name, this.appData, this.docs})
      : super(key: key);
  final int applicationNumber;
  final String name;
  final Map<String, dynamic> appData;
  final List<File> docs;
  @override
  _ApplicationPage5State createState() => _ApplicationPage5State();
}

class _ApplicationPage5State extends State<ApplicationPage5> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Cashfree _cashfree = Cashfree();
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://telepe-f122e.appspot.com');
  StorageUploadTask _uploadTask;
  StorageReference ref;
  List<String> documentURLs = List<String>();
  List<File> documents = List<File>();

  @override
  void initState() {
    _cashfree.on(Cashfree.EVENT_PAYMENT_SUCCESS, _handleCashfreePaymentSuccess);
    _cashfree.on(Cashfree.EVENT_PAYMENT_ERROR, _handleCashfreePaymentError);
    _cashfree.on(Cashfree.EVENT_ERROR, _handleCashfreeError);
//    print(widget.appData['documents']);
    documents = widget.appData['documents'];
    print(documents);
    print("1");

//    print(documents);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/background3.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
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
                                shape: BoxShape.circle, color: blueColor),
                            child: Center(
                              child: Text("4",
                                  style: TextStyle(color: Colors.white)),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text("Get Loan",
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Dear ${widget.name}",
                            style: TextStyle(color: blueColor),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Thanks for Applying",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: blueColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Wrap(
                        children: [
                          Text(
                              "For fast process please pay loan application fees of Rs.199/-(100% Refundable) so, don't worry to pay application fee.")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Process and Get Loan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Please wait!"),
                            ));
                            print(documents);
                            initiatePayment();
                          },
                          child: Text(
                            "Pay",
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                          ),
                          color: yellowColor,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/teelpe25.png"),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Dear ${widget.name}"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Congratulations!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: blueColor),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text(
                                    "Thanks for applying loan. Your Application Number is:"),
                                InkWell(
                                    onTap: () {
                                      Clipboard.setData(new ClipboardData(
                                          text: widget.applicationNumber
                                              .toString()));
                                      scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content:
                                            new Text("Copied to Clipboard"),
                                      ));
                                    },
                                    child: SelectableText(
                                      widget.applicationNumber.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                Text(
                                    "Please Wait for Next Notification or you can check status from Loan Tracking Section"),
                                FlatButton(
                                  child: Text(
                                    "Home",
                                    style: TextStyle(
                                        color: blueColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NavBar()),
                                        (route) => false);
                                  },
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  initiatePayment() async {
    String orderId = widget.appData['applicationnumber'].toString();
    String token = await cashFreeToken().getToken(orderId, 199);
    var options = {
      'token': token,
      'stage': "PROD",
      'appId': "57663ad830b5854b39d3205f136675",
      'orderId': orderId,
      'orderAmount': 199,
      'orderNote': "TestNote",
      'orderCurrency': "INR",
      'customerName': widget.name,
      'customerPhone': widget.appData['mobilenum'],
      'customerEmail': widget.appData['emailid'],
      'notifyUrl': '',
      "paymentModes": ''
    };
    _cashfree.doPayment(options);
  }

  void _handleCashfreePaymentSuccess(
      CashfreePaymentSuccessResponse response) async {
    print("Cashfree payment success orderId:${response.orderId}");
    print(documents);
    print("3");
    uploadApplicationDetails(
        response.referenceId, response.paymentMode, response.orderId);
    checkReferral();
    _getDialog();
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

  uploadApplicationDetails(
      String refID, String paymentMode, String orderId) async {
    print("Adding up Data!");
    var info = widget.appData;
    print(info['documents']);
    print(documents);
    await Future.wait(documents.map((File file) async {
      String filePath =
          "${info['uid']}/${DateTime.now().millisecondsSinceEpoch}";
      _uploadTask = _storage.ref().child(filePath).putFile(file);
      StorageTaskSnapshot storageTaskSnapshot;
      StorageTaskSnapshot snapshot = await _uploadTask.onComplete;
      if (snapshot.error == null) {
        storageTaskSnapshot = snapshot;
        final String downloadUrl =
            await storageTaskSnapshot.ref.getDownloadURL();
        documentURLs.add(downloadUrl);
        print('Upload success');
      } else {
        print('Error from repo ${snapshot.error.toString()}');
        throw ('Something went wrong');
      }
    }));
    info.remove("documents");
    info['documenturls'] = documentURLs;
    info["referenceId2"] = refID;
    info["paymentMode2"] = paymentMode;
    info["orderId2"] = orderId;
    info['timestamp'] = DateTime.now().millisecondsSinceEpoch;
    print(info);
    await Firestore.instance
        .collection("LoanApplications")
        .document()
        .setData(info);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Upload Complete!"),
    ));
  }

  checkReferral() async {
    try {
      bool success = false;
      var user = await FirebaseAuth.instance.currentUser();
      var refUID =
          await Firestore.instance.collection("users").document(user.uid).get();
      if (refUID.data['invitedBy'] != "none" &&
          refUID.data['referralDone'] == false) {
        await Firestore.instance
            .collection("users")
            .document(refUID.data['invitedBy'])
            .updateData({
          "telepePoints": FieldValue.increment(50),
        });
        success = true;
      }
      if (success) {
        await Firestore.instance
            .collection("users")
            .document(user.uid)
            .updateData({
          "referralDone": true,
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
