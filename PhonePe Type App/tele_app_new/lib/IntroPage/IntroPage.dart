

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:telepeapp/Registration/Registration.dart';
import 'package:telepeapp/Registration/mpinlogin.dart';
import 'package:telepeapp/colors.dart';

class IntroPage extends StatefulWidget {
  
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Timer _timer;
  int _currentPage=0;
  final pageView= PageController(
    initialPage: 0
  );
  final pageViewMain= PageController(
      initialPage: 0
  );

 @override
  void initState() {
    _timer=Timer.periodic(Duration(seconds: 5),(Timer timer){
      if(_currentPage<6){
        _currentPage++;
      }
      else{
        _currentPage=0;
      }
      pageView.animateToPage(_currentPage, duration: Duration(milliseconds: 350), curve: Curves.easeIn);

    });
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          FlatButton(
            child: Text("Skip",style:TextStyle(color: Colors.white)),
            onPressed: (){
              _timer.cancel();
              pageView.animateToPage(6, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
            },
          )
        ],
      ),
        body: getBody(),
    );
  }

  getBody() {
//    return PageView(
//      controller: pageViewMain,
//      children: [
//        getPage1(),
//
//      ],
//    );
  return  PageIndicatorContainer(
    child: PageView(
      controller: pageView,
      children: [
        getPage2(),
        getPage3(),
        getPage4(),
        getPage5(),
        getPage6(),
        getPage7()
      ],
    ),
    length: 6,
    align: IndicatorAlign.bottom,
    indicatorColor: greyColor,
    indicatorSelectorColor: blueColor,
  );
  }

  getPage1() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/8.jpg",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,-.45),
          child: Image.asset("assets/telepegif.gif",height: 125,width: 125,),
        ),
      ],
    );
  }

  getPage2() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/6.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "100% Loan Guarantee as per profile",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  getPage3() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/4.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "Telepe will not check Credit/CIBIL Score",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  getPage4() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/5.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "PAN India Service Providers",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  getPage5() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/3.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "100% Quick and Transparent Policies",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

  }
  getPage6() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/2.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "Low Salary/Income can Apply",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

  }
  getPage7() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/Intro/7.png",fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment(0,0.5),
          child: Text(
            "Quick & Convenient Application",style: TextStyle(color: blueColor,fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment(0,.6),
          child:Text("100% Paperless")
        ),
        Align(
          alignment: Alignment(0,.65),
          child:  MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: blueColor,
            minWidth: MediaQuery.of(context).size.width/1.5,
            child: Text("Register",style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegistrationPage()), (route) => false);
            },
          ),
        )
      ],
    );

  }
}
