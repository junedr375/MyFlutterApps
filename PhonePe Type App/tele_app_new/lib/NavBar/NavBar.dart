

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telepeapp/HomePage/HomeScreen.dart';
import 'package:telepeapp/MyAccount/my_account.dart';
import 'package:telepeapp/Mywallet/MyWallet.dart';
import 'package:telepeapp/ReferAndEarn/ReferEarn.dart';
import 'package:telepeapp/Registration/authentication.dart';
import 'package:telepeapp/Registration/mpinlogin.dart';

import '../colors.dart';
int currentIndex=2;
class NavBar extends StatefulWidget {
  NavBar({Key key,this.index}):super(key:key);
  final int index;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final List<Widget> _widgetOptions = <Widget>[
    MyAccount(),
    MyWallet(),
    HomeScreen(),
    refer(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions[currentIndex],
      bottomNavigationBar:BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      currentIndex=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/1a.png",fit: BoxFit.cover,height: 25,width: 25,color: currentIndex==0?blueColor: Colors.black,),
                      Text("Account",style: TextStyle(color:currentIndex==0?blueColor: Colors.black,fontSize: 8),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      currentIndex=1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/ha.png",fit: BoxFit.cover,height: 25,width: 25,color: currentIndex==1?blueColor: Colors.black),
                      Text("Wallet",style: TextStyle(color:currentIndex==1?blueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      currentIndex=2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/mmqq.png",fit: BoxFit.cover,height: 25,width: 25,color: currentIndex==2?blueColor: Colors.black),
                      Text("Home",style: TextStyle(color:currentIndex==2?blueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 20,
                child: MaterialButton(

                  onPressed: (){
                    setState(() {
                      currentIndex=3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/llll.png",fit: BoxFit.cover,height: 25,width: 25,color:currentIndex==3?blueColor: Colors.black),
                      Text("Share",style: TextStyle(color:currentIndex==3?blueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MPinLoginPage()), (route) => false);
                    //AuthService().signOut();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/khgfg.png",fit: BoxFit.cover,height: 25,width: 25,color:currentIndex==4?blueColor: Colors.black),
                      Text("Logout",style: TextStyle(color:currentIndex==4?blueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }

}

