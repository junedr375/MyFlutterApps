import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telepeapp/HomePage/HomeScreen.dart';
import 'package:telepeapp/IntroPage/IntroPage.dart';
import 'package:telepeapp/LoadingScreen.dart';
import 'package:telepeapp/Registration/Registration.dart';
import 'package:telepeapp/Registration/mpinlogin.dart';

class AuthService {
  handleAuth(){
    return StreamBuilder(

        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
         if(snapshot.connectionState==ConnectionState.active){
           FirebaseUser user= snapshot.data;
           if(user==null){
             return IntroPage();
           }
           return MPinLoginPage();
         }
         else{
           return Scaffold(
             body: Center(child: Text("Initializing.."),),
           );
         }
        });
//  var user=FirebaseAuth.instance.currentUser();
//  if(user!=null){
//    return MPinLoginPage();
//  }
//  else
//    {
//      return IntroPage();
//    }
 }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }

}