import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telepeapp/MyAccount/my_account.dart';
import 'package:telepeapp/MyAccount/profile_pic_selection.dart';
import 'package:telepeapp/NavBar/NavBar.dart';
import 'package:telepeapp/colors.dart';



class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  var data;
  bool loading=true;
  var name="";
  var phoneNo="";
  String email="";
  var place="";
  var mpin="";
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(loading) ? Center(child: CircularProgressIndicator()):
      SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/asd1.png', fit: BoxFit.cover,),
              ),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  child: new Column(
                    children: <Widget>[
                     // Padding(padding: new EdgeInsets.only(top: MediaQuery.of(context).size.width / 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(child: Image.asset("assets/backkkll.png",height: 50,width: 50,),onPressed: (){
                            Navigator.pop(context);
                          },),
                          Spacer(flex: 1,),
                          Center(
                            child: new Text('Edit', style: new TextStyle(fontSize: 25.0, color: Colors.white),),
                          ),
                          Spacer(flex: 2,),
                        ],
                      ),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:  (data.containsKey("profilepic")) ? NetworkImage(data['profilepic']): new AssetImage('assets/prof.png')
                            )
                        ),
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new IconButton(icon: Icon(Icons.edit,size: 30,), onPressed: (){
                              Navigator.push(context, MaterialPageRoute( builder: (context)=> ProfilePicSelection()));
                            }, color: Colors.grey,)
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/15,),
                      Padding(padding: new EdgeInsets.only(top: MediaQuery.of(context).size.height/15),),
                      displayInfo('Name', data['name']),
                      Padding(padding: const EdgeInsets.only(top: 12.0),),
                      displayInfo('Phone Number', data['phonenum']),
                      Padding(padding: const EdgeInsets.only(top: 12.0),),
                      displayInfo('E-Mail id', data.containsKey('email')?data['email']:'Not given'),
                      Padding(padding: const EdgeInsets.only(top: 12.0),),
                      displayInfo('Place', data['place']),
                      Padding(padding: const EdgeInsets.only(top: 12.0),),
                      displayInfo('M-Pin', data['mpin']),
                      Padding(padding: const EdgeInsets.only(top: 35.0),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(11.0, 11.0, 16.0, 11.0),
                            child: FlatButton(onPressed: ()async{
                              setState(() {
                                if(name==""){
                                  name=data['name'];
                                }
                                if(phoneNo==""){
                                  phoneNo=data['phonenum'];
                                }
                                if(email==""){
                                  email=data['email'];
                                }
                                if(place==""){
                                  place=data['place'];
                                }
                                if(mpin==""){
                                  mpin=data['mpin'];
                                }
                              });
                              var user = await FirebaseAuth.instance.currentUser();
                              await Firestore.instance
                                  .collection("users")
                                  .document(user.uid)
                                  .updateData({
                                "name": name,
                                "place": place,
                                "phonenum":phoneNo,
                                "email":email,
                                "mpin": mpin,
                              });
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBar()), (route) => false);
                            }, child: Text('Save', style: TextStyle(fontSize: 18.0, color: blueColor), ), shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)), color: yellowColor,),
                          )
                        ],
                      )
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



  displayInfo(String field, String val) {
    double _width = MediaQuery.of(context).size.width;
    return new Container(
      width: _width,
      height: 60.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: _width / 3,
            child: new Text('$field', style: new TextStyle(fontSize: 16.0),),
          ),

          Padding(padding: EdgeInsets.all(12.0),),

          Container(
            width: _width/ 2,
            height: 60.0,
//            color: greyColor,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: _width,
              child: TextFormField(
                maxLength: (field=="M-Pin")?6:30,
                onChanged: (val){
                  if(field=="Name"){
                  setState(() {
                  name=val;
                  });
                  }
                    if(field=="Phone Number"){
                      setState(() {
                        phoneNo=val;
                      });
                    }
                    if(field=="E-Mail id"){
                      setState(() {
                        email=val;
                      });
                    }
                    if(field=="Place"){
                      setState(() {
                        place=val;
                      });
                    }
                    if(field=="M-Pin"){
                      setState(() {
                        mpin=val;
                      });

                    }
                  },
                textAlign: TextAlign.center,
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
                    hintText: val,
                    hintStyle: TextStyle(
                        color: Colors.black),
                    filled: true,
                    fillColor: greyColor

                ),
                keyboardType: (field.compareTo('Phone Number') == 0||field.compareTo('M-Pin') == 0) ? TextInputType.phone : TextInputType.text,
              ),
            )
          )
        ],
      ),
    );

  }
  getData() async{
    var user=await FirebaseAuth.instance.currentUser();
    await Firestore.instance.collection("users").document(user.uid).get().then((val) {
      data=val.data;
    }
    );
    print(data);
    setState(() {
      loading=false;
    });
  }

}






