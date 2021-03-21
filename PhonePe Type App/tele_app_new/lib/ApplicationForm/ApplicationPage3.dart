

import 'dart:io';
import 'dart:math';
//import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage2.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage4.dart';
import 'package:telepeapp/colors.dart';

class ApplicationPage3 extends StatefulWidget {
  ApplicationPage3({Key key,this.map}):super(key:key);
  final Map<String,dynamic> map;
  @override
  _ApplicationPage3State createState() => _ApplicationPage3State();
}

class _ApplicationPage3State extends State<ApplicationPage3> {
  //List<String> documentURLs=List<String>();
  List<File> documents=List<File>();
  double loanamount=5000.0;
  String loanamountString="5000";
  String monthsString="3";
  double months=3.0;
  final pancardController=TextEditingController(text:"Upload");
  final adhaarfrontController=TextEditingController(text:"Upload");
  final adhaarbackController=TextEditingController(text:"Upload");
  final photoController=TextEditingController(text:"Upload");
  File pancard;
  File adhaarfront;
  File adhaarback;
  File photo;
  bool PanCardDone=false;
  bool adFDone=false;
  bool adBDone=false;
  bool photoDone=false;
  var applicationData;
  final scaffoldKey=GlobalKey<ScaffoldState>();
//  final FirebaseStorage _storage =
//  FirebaseStorage(storageBucket: 'gs://telepe-f122e.appspot.com');
//  StorageUploadTask _uploadTask;
//  StorageReference ref;
  var applicationNumber;
  @override
  void initState() {
    int min = 10000000; //min and max values act as your 6 digit range
    int max = 99999900;
    var randomizer = new Random();
    applicationNumber = min + randomizer.nextInt(max - min)+DateTime.now().millisecondsSinceEpoch;
    super.initState();
  }
  @override
  void dispose() {
    FilePicker.clearTemporaryFiles();
    documents.clear();
    super.dispose();
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
                  "assets/1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 75,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/teelpe15.png",height: 75,width: 75,),
                    ],
                  ),

                  Text("Application Form",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor
                          ),
                          child: Center(child: Text("1",style: TextStyle(color: Colors.white),),),
                        ),
                        Expanded(
                          child: Container(color: blueColor,height: 2,),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor
                          ),
                          child: Center(child: Text("2",style: TextStyle(color: Colors.white),),),
                        ),
                        Expanded(
                          child: Container(color: blueColor,height: 2,),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: yellowColor
                          ),
                          child: Center(child: Text("3"),),
                        ),
                        Expanded(
                          child: Container(color: greyColor,height: 2,),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greyColor
                          ),
                          child: Center(child: Text("4"),),
                        ),
                        Expanded(
                          child: Container(color: greyColor,height: 2,),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greyColor
                          ),
                          child: Center(child: Text("5"),),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Personal",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Income",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Loan\nSelect",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Verify\nAccount",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Get Loan",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child:Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            child: Text("How much amount needed:",style: TextStyle(fontSize: 12,color: blueColor,fontWeight: FontWeight.w400),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            child: Text("\u20b9${loanamountString}",style: TextStyle(fontSize: 15,color: blueColor,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5k"),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child:Slider(
                            activeColor: blueColor,
                            divisions: 99,
                            onChanged: (val){
                              setState(() {
                                loanamountString=val.toStringAsFixed(0);
                                loanamount=val;
                              });
                            },
                            min: 5000,
                            max: 500000,
                            value: loanamount,
                          ),
                        ),
                        Text("5Lac")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            child: Text("Choose Tenure:",style: TextStyle(fontSize: 15,color: blueColor,fontWeight: FontWeight.w400),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            child: Text("${monthsString}M",style: TextStyle(fontSize: 15,color: blueColor,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("3M"),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child:Slider(
                            activeColor: blueColor,
                            divisions: 11,
                            onChanged: (val){
                              setState(() {
                                monthsString=val.toStringAsFixed(0);
                                months=val;
                              });
                            },
                            min: 3,
                            max: 36,
                            value: months,
                          ),
                        ),
                        Text("3 Yrs")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Upload Documents",style: TextStyle(color: blueColor,fontWeight: FontWeight.w400),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Center(child: Text("Pan Card",style: TextStyle(fontWeight: FontWeight.w500),))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2.5,
                              child: InkWell(
                                  onTap: ()=>getPanCard(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 45,
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 80,
                                            child: Center(child: Text(pancardController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                        Expanded(flex: 20,
                                            child: Icon(Icons.attach_file,color: blueColor,),)
                                      ],
                                    ),
                                  )),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Center(child: Text("Adhaar Front",style: TextStyle(fontWeight: FontWeight.w500),))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2.5,
                              child: InkWell(
                                  onTap: ()=>getAdhaarFront(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 45,
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 80,
                                            child: Center(child: Text(adhaarfrontController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                        Expanded(flex: 20,
                                          child: Icon(Icons.attach_file,color: blueColor,),)
                                      ],
                                    ),
                                  )),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Center(child: Text("Adhaar Back",style: TextStyle(fontWeight: FontWeight.w500),))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2.5,
                              child: InkWell(
                                  onTap: ()=>getAdhaarBack(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 45,
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 80,
                                            child: Center(child: Text(adhaarbackController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                        Expanded(flex: 20,
                                          child: Icon(Icons.attach_file,color: blueColor,),)
                                      ],
                                    ),
                                  )),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Center(child: Text("Photo",style: TextStyle(fontWeight: FontWeight.w500),))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2.5,
                              child:InkWell(
                                  onTap: ()=>getPhoto(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 45,
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 80,
                                            child: Center(child: Text(photoController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                        Expanded(flex: 20,
                                          child: Icon(Icons.attach_file,color: blueColor,),)
                                      ],
                                    ),
                                  )),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ApplicationPage3()));
                        },
                        child: Text("Change",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
                        color: yellowColor,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: (){
                         if(documents.length>3){
                           uploadData();
                           _getDialog();
                         }
                         else{
                           scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please upload all Documents!"),));
                         }
                        },
                        child: Text("Next",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
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
    );
  }

   _getDialog() {
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width/1.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/1w.png"),
              fit: BoxFit.fill
            )
          ),
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
                               Text("Dear ${widget.map['fullname']}",),
                               Text("Congratulations!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: blueColor),),
                             ],
                           )
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("You are eligible to apply loan\n of \u20b9${loanamountString} for $monthsString Months."),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Kindly Verify your Bank Account to get Loan."),
                     ),
                     RaisedButton(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Text("GO",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
                       onPressed: (){
                         Navigator.push(context, CupertinoPageRoute(builder: (context)=>ApplicationPage4(applicationData: applicationData,)));
                       },
                       color: yellowColor,
                     )
                   ],
                  ),
            ],
          ),
        ),

      );
      }
    );
  }

  getPanCard() async{
    if(PanCardDone==true){
      documents.removeAt(0);
    }
    pancard=await FilePicker.getFile(type: FileType.any
    );
    documents.insert(0, pancard);
    var path=pancard.path.split("/").last;
    setState(() {
      pancardController.text=path;
    });
    PanCardDone=true;
    print(documents);
  }
  getAdhaarFront() async{
    if(adFDone){
      documents.removeAt(1);
    }

    adhaarfront=await FilePicker.getFile(type: FileType.any,
    );
    documents.insert(1, adhaarfront);
    setState(() {
      adhaarfrontController.text=adhaarfront.path.split("/").last;
    });
    adFDone=true;
  }
  getAdhaarBack() async{
    if(adBDone){
      documents.removeAt(2);
    }
    adhaarback=await FilePicker.getFile(type: FileType.any,
    );
    documents.insert(2, adhaarback);
    setState(() {
      adhaarbackController.text=adhaarback.path.split("/").last;
    });
    adBDone=true;
  }
  getPhoto() async{
    if(photoDone){
      documents.removeAt(3);
    }
    photo=await FilePicker.getFile(type: FileType.any,

    );
    documents.insert(3, photo);
    setState(() {
      photoController.text=photo.path.split("/").last;
    });
    photoDone=true;
    print(documents);
  }

  uploadData() async{
    var user=await FirebaseAuth.instance.currentUser();
    var info=widget.map;
    info["loanamount"]=loanamountString;
    info['tenure']=monthsString+"months";
    info['uid']=user.uid;
    info['applicationnumber']=applicationNumber;
    info['documents']=documents;
    print(info);
    setState(() {
      applicationData=info;
    });
  }

}

