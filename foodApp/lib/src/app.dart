import 'package:flutter/material.dart';
import 'package:chatapp/src/homescreen.dart';

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: "Food Delivery App",
			theme: ThemeData(
				primaryColor: Colors.blueAccent
			),//ThemeData
			home: HomeScreen(),
		);//MaterialApp
	}
}
