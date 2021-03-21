import 'package:flutter/material.dart';
import 'package:telepeapp/colors.dart';
class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
                //colorFilter: ColorFilter.mode(Color.fromRGBO(192, 234, 218,1).withOpacity(0.6), BlendMode.softLight),
              ),
            ),
          ),
          Align(
              alignment: Alignment(0,-.5),
              child: Text("Support",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          Align(
              alignment: Alignment(0,-.4),
              child: Text("If you need any support related to services")),
          Align(
              alignment: Alignment(0,-.3),
              child: Text("then please mail to")),
          Align(
              alignment: Alignment(0,-.2),
              child: Text("support@telepe.in",style: TextStyle(fontWeight: FontWeight.bold,color: blueColor),)),
          Align(
              alignment: Alignment(0,-.1),
              child: Text("Our team will reply soon")),
          Align(
              alignment: Alignment(0,0),
              child: Text("Thanks by TelePe",style: TextStyle(color: blueColor,fontWeight: FontWeight.w500),),),
        ],
      ),

    );
  }
}
