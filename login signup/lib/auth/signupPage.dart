import 'package:flutter/material.dart';
import 'package:pv/services/userManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pv/auth/loginPage.dart';
import 'package:pv/Pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _displayName, _email, _password ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white24,
            leading: new IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/welcomepage');
                }
            )
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text('Create an account',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),//Stack
            ),//Container
            Container(
                padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
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
                         // icon: Icon(Icons.email),
                      ),
                      SizedBox(height: 2.0),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                          onSaved: (value){
                            _password = value;
                          } ,
                          validator: (value) => value.isEmpty ? "*Required" : null,
                      ),
                      SizedBox(height: 2.0),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          onSaved:(value){
                            _displayName = value;
                          },
                          validator: (value) => value.isEmpty ? "*Required" : null,
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        width: 270,
                        height: 35,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.8),
                        ),
                        child: OutlineButton(
                          child: Center(
                              child: Text('Signup',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  )
                              )
                          ),
                          onPressed: signUp,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.only( bottom: 10.0),
                          child:Center(
                          child: Text('Have an account',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black38)),
                          ),
                      ),
                      Container(
                       
                        height: 35.0,
                        width: 270,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.6),
                          elevation: 0,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>LoginPage() ),
                              );
                            },
                          ),
                        ),
                      ),//Container
                      SizedBox(height: 20,),
                    ],//Widget
                  ),//Column
                ),//Form
              ),//Container

              Container(
                padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Text('___________',
                                style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.black38)),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 105, top: 10),
                              child: Text('or continue with',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38)),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 220),
                              child: Text('__________',
                                  style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold,
                                    color: Colors.black38)),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 50),
                              child: Container(
                                width: 130,
                                height: 37,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color.fromRGBO(81, 113, 100, 0.2),
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
                              padding: EdgeInsets.only(top: 50, left: 170),
                              child: Container(
                                width: 130,
                                height: 37,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color.fromRGBO(81, 113, 100, 0.2),
                                ),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7),
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Center(
                                        child: new Image.asset(
                                          'images/facebookicon.png',),
                                      ),
                                      onPressed: ()  {
                                        loginWithFB().whenComplete(() {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));

                                        });
                                      },

                                    )
                                )
                              )
                            ),
                          ],//Widget
                        ),//Stack
                      ),//Center
                    ),//Container
                  ],//Widget
                ),//Column 
              ),//Container
            ],//Widget
          ),//Column
      );//Scaffold

  }
  Future<void> signUp() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword( email: _email, password: _password);
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
          userUpdateInfo.displayName = _displayName;
          user.updateProfile(userUpdateInfo);/*.then((onValue) {*/
           // Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
            /*Firestore.instance.collection('users').document().setData(
              {'email': _email, 'displayName': _displayName}).then((onValue) {
                _sheetController.setState(() {
                _loading = false;
              });
            });
              */

        //user.sendEmailVerification();
        Navigator.of(context).pop();
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage() ));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home() ));
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


