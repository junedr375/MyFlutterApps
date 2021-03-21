

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:telepeapp/ApplicationForm/ApplicationPage1.dart';
import 'package:telepeapp/HomePage/Notifications.dart';
import 'package:telepeapp/ReferAndEarn/ReferEarn.dart';
import 'package:telepeapp/Support/Support.dart';
import 'package:telepeapp/colors.dart';
import 'package:telepeapp/drawer.dart';
import 'package:telepeapp/token_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username="";
  bool loading=true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var shadows=[
    Shadow( // bottomLeft
        offset: Offset(-1.0, -1.0),
        color: Colors.white
    ),
    Shadow( // bottomRight
        offset: Offset(1.0, -1.0),
        color: Colors.white
    ),
    Shadow( // topRight
        offset: Offset(1.0, 1.0),
        color: Colors.white
    ),
    Shadow( // topLeft
        offset: Offset(-1.0, 1.0),
        color: Colors.white
    ),
  ];
  int i=0;
  final carouselController=PageController();
  int _currentPage=0;
  int _currentPage2=0;
  Timer _carouselTimer;
  //InfiniteScrollController clientScroll=InfiniteScrollController(initialScrollOffset: 0.0);
  final clientScroll=PageController(viewportFraction: 1/3,initialPage: 1);
  Timer clientTimer;
  bool isNotification=false;
  int notificationCounter=0;
  @override
  void initState() {
    getData();
    _carouselTimer=Timer.periodic(Duration(seconds: 7),(Timer timer){
      if(_currentPage<6){
        _currentPage++;
      }
      else{
        _currentPage=0;
      }
      carouselController.animateToPage(_currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeIn);

    });
    clientTimer=Timer.periodic(Duration(seconds: 8),(Timer timer){
      if(_currentPage2<14){
        _currentPage2++;
      }
      else{
        _currentPage2=0;
      }
      clientScroll.animateToPage(_currentPage2, duration: Duration(seconds: 8), curve: Curves.linear);
    });

    super.initState();
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:Draw(context: context),
      body: getBody(),
    );
  }

  SafeArea getBody() {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/kihk.png",
              fit: BoxFit.cover,
            ),
          ),
          getContents(),
        ],
      ),
    );
  }

  getContents() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       Expanded(flex: 10,
           child: getHeader()),
        Expanded(
          flex: 25,
          child: getCarousel(),
        ),
        Expanded(
          flex: 45,
          child: getLoans(),
        ),
        Expanded(
          flex: 10,
          child: getClients(),
        )
        //getFeedBack(),

      ],
    );
  }

 Padding getHeader() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(child: Image.asset("assets/9k.png",height: 50,width: 50,),onPressed: (){
            scaffoldKey.currentState.openDrawer();
          },),
//          Text(" Hello  ",style: TextStyle(fontSize:20,shadows: shadows
//          ),),
          Spacer(flex: 1,),
          //(loading)?Text("Loading.."):SizedBox(width:MediaQuery.of(context).size.width/4,child: AutoSizeText(_username,maxLines:1,minFontSize:5,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
          InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Support())),

              child: Image.asset("assets/hl.png",height: 50,width: 50,)),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsPage()));

              },
              child: (isNotification)?Badge(
                  badgeContent: Text(notificationCounter.toString()),
                  child: Image.asset("assets/haj.png",height: 50,width: 50,)):Image.asset("assets/haj.png",height: 50,width: 50,)),
        ],
      ),

    );
  }

  getCarousel() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width/1.2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/teelpe10.png")
          )
        ),
        child: PageIndicatorContainer(
          child: PageView(
            controller: carouselController,
            children: [
              Image.asset("assets/BANNER/bannertele0.png",fit: BoxFit.fill,),
              Image.asset("assets/BANNER/bannertelepe.png",fit: BoxFit.fill,),
              Image.asset("assets/BANNER/bannertelepe1.png",fit: BoxFit.fill,),
              Image.asset("assets/BANNER/bannertelepe3.png",fit: BoxFit.fill,),
              Image.asset("assets/BANNER/bannertelepe4.png",fit: BoxFit.fill,),
              Image.asset("assets/BANNER/bannertelepe5.png",fit: BoxFit.fill,),
            ],
          ),
          length: 6,
          indicatorSelectorColor: blueColor,
        ),
      ),
    );
  }

  getLoans() {
    var imagesize=MediaQuery.of(context).size.height/18;
    var font1=MediaQuery.of(context).size.height/95;
    const double padding1=4.0;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplicationPage1()));
              },
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children:[
                      Image.asset("assets/a.png",height: imagesize,width: imagesize,),
                      Image.asset("assets/b.png",height: imagesize,width: imagesize,),
                      Image.asset("assets/c.png",height: imagesize,width: imagesize,),
                    ]
                  ),
                  TableRow(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(padding1),
                        child: Center(child: Text("Instant Personal Loan",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold,),textAlign: TextAlign.center)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(padding1),
                        child: Center(child: Text("Instant Business Loan",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(padding1),
                        child: Center(child: Text("Low CIBIL Loan",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                      Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                      Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),

                    ]
                  ),
                  TableRow(
                      children: [
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),

                      ]
                  ),
                  //1st
                  TableRow(
                      children:[
                        Image.asset("assets/d.png",height: imagesize,width: imagesize,),
                        Image.asset("assets/f2.png",height: imagesize,width: imagesize,),
                        Image.asset("assets/ga.png",height: imagesize,width: imagesize,),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(padding1),
                          child: Center(child: Text("Instant Loan\n(Android/iOS/Web)",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding1),
                          child: Center(child: Text("Instant Apply\n(MSME Loan)",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding1),
                          child: Center(child: Text("Instant Student Loan",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),

                      ]
                  ),
                  TableRow(
                      children: [
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),

                      ]
                  ),
                  //2nd
                  TableRow(
                      children:[
                        Image.asset("assets/z.png",height: imagesize,width: imagesize,),
                        Image.asset("assets/n.png",height: imagesize,width: imagesize,),
                        GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>refer())),
                            child: Image.asset("assets/m.png",height: imagesize,width: imagesize,)),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(padding1),
                          child: Center(child: Text("Instant Loan\n(Low Salary/Income)",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold,),textAlign: TextAlign.center)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding1),
                          child: Center(child: Text("Instant Daily Basis/\nPrivate Loan",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                        ),
                        GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>refer())),
                          child: Padding(
                            padding: const EdgeInsets.all(padding1),
                            child: Center(child: Text("Refer and Earn\n(Earn upto 2Lac/Month)",style: TextStyle(fontSize: font1,color: blueColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("No Cibil Check",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("",style: TextStyle(fontSize: 5),)),

                      ]
                  ),
                  TableRow(
                      children: [
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("3 EMI Free Support",style: TextStyle(fontSize: font1),)),
                        Center(child: Text("",style: TextStyle(fontSize: 5),)),

                      ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getFeedBack() {
    return Row(
    children: [
      Expanded(
        flex: 50,
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 30,
                        child: Container(
                          color: blueColor,
                        ),
                      ),
                      Expanded(
                        flex: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/ka.png",height: 20,width: 20,),
                            SizedBox(height: 100,width: 100,),
                            Image.asset("assets/ka1.png",height: 20,width: 20,),

                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment(-0.5,-.6),
                    child: Image.asset("assets/prof.png",height: 60,width: 60,color: Colors.black,),
                  ),
                  Align(
                    alignment: Alignment(0.5,-.7),
                    child: Text("Name",style: TextStyle(color: Colors.white),),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 50,
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/thanks.png"),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Thanks Telepe Message",style: TextStyle(shadows: shadows,fontWeight: FontWeight.bold),),
                        Text("Name",style: TextStyle(shadows: shadows,fontWeight: FontWeight.bold),),
                        Text("Age",style: TextStyle(shadows: shadows,fontWeight: FontWeight.bold),),
                        Text("Place",style: TextStyle(shadows: shadows,fontWeight: FontWeight.bold),),
                        Text("Loan Amount",style: TextStyle(shadows: shadows,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ],
    );

  }

  getClients() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/30,bottom: MediaQuery.of(context).size.height/30,left: 5,right: 5),
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: blueColor
                  ),width:75,child: Center(child: Text("Our Top Financiers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 6,color: Colors.white),))),
            ),
          ),
          Expanded(
            flex: 80,
            child: PageView.builder(
              controller: clientScroll,
              itemCount: partnerLogos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext bc,int index){
                return partnerLogos[index];

              },
            ),
          ),
        ],
      ),
    );
  }

  getData() async{
    var user=await FirebaseAuth.instance.currentUser();
    await Firestore.instance.collection("LoanApplications").where("uid",isEqualTo: user.uid).snapshots().listen((event) {
      event.documentChanges.forEach((element) {
        if(element.type==DocumentChangeType.modified){
          setState(() {
            isNotification=true;
            notificationCounter++;
          });
        }

      });
    });
  }
  void dispose() {
    _carouselTimer.cancel();
    clientTimer.cancel();
    super.dispose();
  }

}

