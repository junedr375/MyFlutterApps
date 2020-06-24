import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pv/auth/signupPage.dart';
import 'package:pv/services/signInManagement.dart';
import 'package:pv/Pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _fbLogin = new FacebookLogin();
  
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white24,
            /*leading: new IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/welcomepage');
                }
            )*/
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Center(
                      child: Text('Log In',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),    
            child: Form(
              key: _formKey,
              //autovalidate: _autoValidate,
               child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onSaved: (value) {
                          _email = value;
                        },
                        validator: emailValidator,
                        //icon: Icon(Icons.email),

                      ),

                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onSaved: (value) {
                        
                            _password = value;
                          },
                         // icon: Icon(Icons.lock),
                        validator: (value) => value.isEmpty ? "*Required" : null,
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 25.0, left: 20.0),
                        child: InkWell(
                            child: Center(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.6),
                          elevation: 0,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: signIn,
                          ),
                        ),
                      ),//Container

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          padding: EdgeInsets.only( bottom: 10.0),
                          child:Center(
                          child: Text("Don't Have an account Create One!",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black38)),
                          ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.6),
                          elevation: 0,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>SignupPage() ),
                              );
                            },
                          ),
                        ),
                      ),//Container
                    ],//Widget
                  ),//Column
                ),//Form
              ),//Container
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Container(
                        child: Center(
                            child: Stack(
                              children: <Widget>[

                                Container(
                                  child: Text('___________',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38)),
                                ),

                                Container(
                                  padding: EdgeInsets.only(
                                      left: 105, top: 10),
                                  child: Text('or continue with',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black38)),
                                ),

                                Container(
                                  padding: EdgeInsets.only(left: 220),
                                  child: Text('__________',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38)),
                                ),

                                Container(
                                    padding: EdgeInsets.only(top: 60),
                                    child: Container(
                                        width: 130,
                                        height: 40,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              7.0),
                                          color: Color.fromRGBO(
                                              81, 113, 100, 0.2),
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                top: 7, bottom: 7),
                                            child: OutlineButton(
                                              borderSide: BorderSide.none,
                                              child: Center(
                                                child: new Image.asset(
                                                  'images/googleicon.png',),
                                              ),
                                              onPressed: ()  {
                                                signInWithGoogle().whenComplete(() {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));

                                                });
                                              },

                                            )

                                        )
                                    )
                                ),

                                Container(
                                    padding: EdgeInsets.only(
                                        top: 60, left: 170),
                                    child: Container(
                                        width: 130,
                                        height: 40,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              7.0),
                                          color: Color.fromRGBO(
                                              81, 113, 100, 0.2),
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5),

                                            child: OutlineButton(
                                              borderSide: BorderSide.none,
                                              child: Center(
                                                child: new Image.asset(
                                                  'images/facebookicon.png',),
                                              ),
                                              onPressed: () {
                                                  loginWithFB().whenComplete(() {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));

                                                });
                                              },
                                            ),

                                        ),
                                    ),
                                ),//Connatiner
                              ],
                            ),
                          ),
                      ),
                    ],
                ),

            ),
          ],
        ),
      );
  }
  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
        //Todo Navigate to home
        }catch(e){
          print(e.message);
        }
      
    }

  }


  String emailValidator(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (value.isEmpty) return '*Required';
      if (!regex.hasMatch(value))
        return '*Enter a valid email';
      else
        return null;
    }


  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }



  
  Future<String> loginWithFB() async {
        try {
        var facebookLogin = new FacebookLogin();
        var result = await facebookLogin.logIn(['email', 'public_profile']);

        if(result.status == FacebookLoginStatus.loggedIn) {
          final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token,

          );
          final FirebaseUser user = await _auth.signInWithCredential(credential);
          print('signed in ' + user.displayName);
          assert(user.email != null);
          assert(user.displayName != null);
          assert(!user.isAnonymous);
          assert(await user.getIdToken() != null);

          final FirebaseUser currentUser = await _auth.currentUser();
          assert(user.uid == currentUser.uid);

          return 'signInWithGoogle succeeded: $user';
          //return user;
         

        }
      }catch (e) {
        print(e.message);
      }
    }

  


}





      
      
