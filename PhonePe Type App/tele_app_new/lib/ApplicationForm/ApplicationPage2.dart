import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:telepeapp/colors.dart';
import 'package:telepeapp/loan/loans.dart';

import 'ApplicationPage3.dart';

class ApplicationPage2 extends StatefulWidget {
  ApplicationPage2({Key key,this.map}):super(key:key);
  final Map<String,dynamic> map;
  @override
  _ApplicationPage2State createState() => _ApplicationPage2State();
}

class _ApplicationPage2State extends State<ApplicationPage2> {
  var salary=true;
  var businessman=false;
  var student=false;
  var working=false;
  var notworking=false;
  String companyName="";
  String experience="";
  String income="";
  String grosssalary="";
  String fatherage="";
  String motherage="";
  String loanpurpose="";
  AssetImage background;
  final formKey=GlobalKey<FormState>();
  @override
  void initState() {
    background=AssetImage("assets/teelpe15.jpg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: background,
                    fit: BoxFit.cover
                  )
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
                              color: yellowColor
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
                      Text("Personal",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Income",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Loan\nSelect",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Verify\nAccount",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text("Get Loan",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Checkbox(
                              value: salary,
                              onChanged: (val){
                                setState(() {
                                  salary=val;
                                  background=AssetImage("assets/teelpe15.jpg");
                                  businessman=false;
                                  student=false;
                                  notworking=false;
                                  working=false;
                                });
                              },
                            ),
                            Text("Salary"),
                            Checkbox(
                              value: businessman,
                              onChanged: (val){
                                setState(() {
                                  businessman=val;
                                  background=AssetImage("assets/teelpe16.jpg");
                                  salary=false;
                                  student=false;
                                  notworking=false;
                                  working=false;
                                });
                              },
                            ),
                            Text("Businessman"),
                            Checkbox(
                              value: student,
                              onChanged: (val){
                                setState(() {
                                  student=val;
                                  background=AssetImage("assets/teelpe31.png");
                                  salary=false;
                                  businessman=false;
                                  notworking=false;
                                  working=true;
                                });
                              },
                            ),
                            Text("Student"),
                          ],
                        ),
                        (student)? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Checkbox(
                              value: working,
                              onChanged: (val){
                                setState(() {
                                  working=val;
                                  notworking=false;
                                });
                              },
                            ),
                            Text("Working"),
                            Checkbox(
                              value: notworking,
                              onChanged: (val){
                                setState(() {
                                  notworking=val;
                                  working=false;

                                });
                              },
                            ),
                            Text("Not Working"),
                          ],
                        ):Container(),
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
                              onChanged: (val) {
                                if (!notworking) {
                                  setState(() {
                                    companyName = val;
                                  });
                                }
                                else {
                                  setState(() {
                                    income = val;
                                  });
                                }
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
                                  hintText: (!notworking)? "  Company Name":"  Family Monthly Income",
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
                                if(!notworking){
                                  setState(() {
                                    experience=val;
                                  });
                                }
                                else{
                                  setState(() {
                                    fatherage=val;
                                  });
                                }
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
                                  hintText: (salary || working)?"  Total Work Experience":(businessman)?("  Company Work Experience"):(notworking)?"  Father Age":null,
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
                                if(salary||working){
                                  setState(() {
                                    grosssalary=val;
                                  });
                                }
                                if(businessman){
                                  setState(() {
                                    income=val;
                                  });
                                }
                                if(notworking){
                                  setState(() {
                                    motherage=val;
                                  });
                                }
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
                                  hintText: (salary || working)?"  Gross Salary":(businessman)?("  Monthly Income"):(notworking)?"  Mother Age":null,
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,),
                                  filled: true,
                                  fillColor: greyColor),
                            ),
                          ),
                        ),
                        (notworking)?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: TextFormField(
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                                return null;
                              },
                              maxLines: 2,
                              onChanged: (val){
                                setState(() {
                                  loanpurpose=val;
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
                                  hintText: "Loan Purpose",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,),
                                  filled: true,
                                  fillColor: greyColor),
                            ),
                          ),
                        ):Container(),
                      ],
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ApplicationPage2()));
                        },
                        child: Text("Change",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold),),
                        color: yellowColor,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: (){
                         if(formKey.currentState.validate()){
                           var details;
                           if(salary){
                             var info=widget.map;
                             info['persontype']="Salaried Person";
                             info['company']=companyName;
                             info['experience']=experience;
                             info['grosssalary']=grosssalary;
                             details=info;
                           }
                           if(working){
                             var info=widget.map;
                             info['persontype']="Working Student";
                             info['company']=companyName;
                             info['experience']=experience;
                             info['grosssalary']=grosssalary;
                             details=info;
                           }
                           if(businessman){
                             var info=widget.map;
                             info['persontype']="Businessman";
                             info['company']=companyName;
                             info['experience']=experience;
                             info['monthlyincome']=income;
                             details=info;
                           }
                           if(notworking){
                             var info=widget.map;
                             info['persontype']="Not Working Student";
                             info['familyincome']=income;
                             info['fatherage']=fatherage;
                             info['motherage']=motherage;
                             info['loanpurpose']=loanpurpose;
                             details=info;
                           }
                           print(details);
                           Navigator.push(context, CupertinoPageRoute(builder: (context)=>ApplicationPage3(map: details,)));
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
    );;
  }


}
