import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:telepeapp/NavBar/NavBar.dart';
import 'package:telepeapp/Registration/MobileLogin.dart';
import 'package:telepeapp/Registration/Registration.dart';
import 'package:telepeapp/colors.dart';

class MPinLoginPage extends StatefulWidget {
  @override
  _MPinLoginPageState createState() => _MPinLoginPageState();
}

class _MPinLoginPageState extends State<MPinLoginPage> {
  final errorSB = SnackBar(
    content: Text("INVALID MPIN"),
  );
  final key = new GlobalKey<ScaffoldState>();
  String enteredmpin = "";
  String _mpin;
  int _currentPage = 0;
  final pageView = PageController(initialPage: 0);
  Timer _timer;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
//      body: PageView(
//        controller: pageView,
//        children: [
//          getPage1(),
//
//        ],
//      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/1.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Image.asset("assets/telelelogo.png",height: 100,width: 100,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "INSTANT,SIMPLE,FAST,ANYTIME",
                    style: TextStyle(color: yellowColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                    "Login M-PIN",
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: PinCodeTextField(
                    textInputType: TextInputType.phone,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      inactiveFillColor: greyColor,
                      activeColor: yellowColor,
                      selectedColor: yellowColor,
                      activeFillColor: yellowColor,
                      inactiveColor: greyColor,
                    ),
                    length: 6,
                    onChanged: (val) {
                      setState(() {
                        enteredmpin = val;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: yellowColor,
                      onPressed: () {
                        key.currentState.showSnackBar(SnackBar(
                          content: Text("Currently Not Working"),
                        ));
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: yellowColor,
                      onPressed: () {
                        if (_mpin == enteredmpin) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavBar()),
                              (route) => false);
                        } else {
                          key.currentState.showSnackBar(errorSB);
                        }
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobileLoginPage()));
                        },
                        child: Text(
                          "or Login by Mobile Number ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        },
                        child: Text("Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: blueColor)))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getData() async {
    var user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection("users")
        .document(user.uid)
        .get()
        .then((val) {
      _mpin = val.data['mpin'];
    });
    print(_mpin);
  }

  getPage1() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/8.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment(0, -.45),
          child: Image.asset(
            "assets/telepegif.gif",
            height: 125,
            width: 125,
          ),
        )
      ],
    );
  }
}
