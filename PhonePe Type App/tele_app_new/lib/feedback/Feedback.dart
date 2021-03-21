import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telepeapp/drawer.dart';

import '../colors.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey=GlobalKey<FormState>();
  String name, emailID, message;
  double boxHeight=60.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/background1.png",
                  fit: BoxFit.cover,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/4,),
                  Text(
                    'FeedBack',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Your Suggesstion is important to us'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thanks by telepe',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: boxHeight,
                        width: 250,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "Required!";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.black87),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: boxHeight,
                        width: 250,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "Required!";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              emailID = val;
                            });
                          },
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              hintStyle: TextStyle(color: Colors.black87),
                              filled: true,
                              hintText: 'Email Id',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 125,
                        width: 250,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "Required!";
                            }
                            return null;
                          },
                          maxLines: 4,
                          onChanged: (val) {
                            setState(() {
                              message = val;
                            });
                          },
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              hintText: 'Message',
                              hintStyle: TextStyle(color: Colors.black87),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () async{
                      if(formKey.currentState.validate()){
                        await Firestore.instance.collection("Feedback").add({
                          "name":name,
                          "email":emailID,
                          "message":message
                        });
                        showDialog(context: context,
                            builder: (context){
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                title: Text("Feedback Submitted!\nThank you for feedback."),
                              );
                            }
                        );
                      }
                      else{
                        setState(() {
                          boxHeight=boxHeight+20;
                        });
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    color: Colors.blueAccent,
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      child: Image.asset(
                        "assets/backkkll.png",
                        height: 50,
                        width: 50,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: new EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10),
                    ),
//              Center(
//                child: Text('My Account', style: new TextStyle(color: Colors.white, fontSize: 25.0),),
//              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
