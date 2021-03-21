import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telepeapp/Registration/authentication.dart';
import 'package:telepeapp/Registration/termsandconditions.dart';

//import 'package:telepeapp/HomePage/HomeScreen.dart';

import 'package:telepeapp/colors.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_){
    runApp(MyApp());
  }
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: blueColor,
       // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthService().handleAuth(),
      //home: HomeScreen(),
    );
  }
}

//class SplashScreen extends StatefulWidget {
//s
//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  @override
//  void initState() {
//    new Future.delayed(Duration(seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthService().handleAuth())));
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: [
//        Container(
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
//          child: Image.asset("assets/8.jpg",fit: BoxFit.fill,),
//        ),
//        Align(
//          alignment: Alignment(0,-.45),
//          child: Image.asset("assets/telepegif.gif",height: 125,width: 125,),
//        )
//
//      ],
//    );
//  }
//}



