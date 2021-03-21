

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage2.dart';
import 'package:telepeapp/colors.dart';
import 'PlaceSelect.dart';
final placeController=TextEditingController(text: "Select Place");
String place="";
class ApplicationPage1 extends StatefulWidget {
  @override
  _ApplicationPage1State createState() => _ApplicationPage1State();
}

class _ApplicationPage1State extends State<ApplicationPage1> {
  DateTime selectedDate = DateTime.now();
  bool rent=false;
  bool own=true;
  String mobileNum="";
  String fullname="";
  String emailid="";
  String dob="";
  String rentAmount="0";
  String married="";
  String address="";
  final dateController=TextEditingController(text:"DOB");
  final marriageController=TextEditingController(text: "Marriage Status");
  final formKey=GlobalKey<FormState>();
  final scaffoldKey=GlobalKey<ScaffoldState>();

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
                  "assets/teelpe31.png",
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/12,),
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
                                color: yellowColor
                            ),
                            child: Center(child: Text("1"),),
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
                            child: Center(child: Text("2"),),
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
                        Text("Personal",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Text("Income",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Text("Loan\nSelect",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Text("Verify\nAccount",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        Text("Get Loan",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          maxLines: 2,
                          validator: (val){
                            if(val.isEmpty){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              fullname=val;
                            });
                          },
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
                              hintText: "  Full Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,),
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
                          maxLength: 10,
                          validator: (val){
                            if(val.isEmpty){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              mobileNum=val;
                            });
                          },
                          decoration: InputDecoration(
                            counterText: "",
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
                              hintText: "  Mobile Number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,),
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
                          validator: (val){
                            if(val.isEmpty){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              emailid=val;
                            });
                          },
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
                              hintText: "  Email ID",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,right: 4),
                              child: Container(
                                height: 50,
                                child: InkWell(
                                    onTap:()=>_selectDate(context),
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
                                              child: Center(child: Text(dateController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                          Expanded(flex: 20,
                                              child: Icon(Icons.calendar_today))
                                        ],
                                      ),
                                    )),

                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 4),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width/2.5,
                                child: InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceSelect()));
                                    },
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
                                              child: Center(child: Text(placeController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                          Expanded(flex: 20,
                                              child: Icon(Icons.keyboard_arrow_down))
                                        ],
                                      ),
                                    )),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context,StateSetter SetState){
                        return SizedBox(
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  child: InkWell(
                                      onTap:getMarriedDialog,
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
                                                child: Center(child: Text(marriageController.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))),
                                            Expanded(flex: 20,
                                                child: Icon(Icons.keyboard_arrow_down))
                                          ],
                                        ),
                                      ))
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            value: rent,
                                            onChanged: (bool val){
                                              setState(() {
                                                rent=val;
                                                own=false;
                                              });
                                            },
                                          ),
                                          Text("Rented"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            value: own,
                                            onChanged: (bool val){
                                              setState(() {
                                               own=val;
                                               rent=false;
                                              });
                                            },
                                          ),
                                          Text("Owned"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    (rent)?Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              rentAmount=val;
                            });
                          },
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
                              hintText: "  Monthly Rent",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ):Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          maxLines: 2,
                          validator: (val){
                            if(val.isEmpty){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (val){
                            setState(() {
                              address=val;
                            });
                          },
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
                              hintText: "  Address",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,),
                              filled: true,
                              fillColor: greyColor),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ApplicationPage1()));
                          },
                          child: Text("Change",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
                          color: yellowColor,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: (){
                              bool goAhead =true;
                              if(marriageController.text=="Marriage Status" || placeController.text=="Select Place" || dateController.text=="DOB"){
                                goAhead=false;
                                scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please fill all details!"),));
                              }

                              if(rentAmount=="0"){
                                rentAmount="Owned";
                              }
                              if(formKey.currentState.validate() && goAhead) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) =>
                                        ApplicationPage2(
                                          map: {
                                            "fullname": fullname,
                                            "mobilenum": mobileNum,
                                            "emailid": emailid,
                                            "dob": dob,
                                            "place": place,
                                            "married": married,
                                            "rent": rentAmount,
                                            "address": address
                                          },
                                        )));
                              }
                          },
                          child: Text("Next",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
                          color: yellowColor,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate:DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text="${selectedDate.toLocal()}".split(' ')[0];
        dob="${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  getMarriedDialog() {
    return showDialog(
        context: context,
      builder: (BuildContext bc){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              groupValue: married,
              value: "Married",
              title: Text("Married"),
              onChanged: (val){
                setState(() {
                  married=val;
                  marriageController.text=val;
                  Navigator.of(context).pop();
                });
              },
            ),
            RadioListTile(
              groupValue: married,
              value: "Not Married",
              title: Text("Not Married"),
              onChanged: (val){
                setState(() {
                  married=val;
                  marriageController.text=val;
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        )
      );
      }
    );
  }
}
