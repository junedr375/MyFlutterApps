import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myredux/Home/Home.dart';
import 'package:myredux/models/CartItem.dart';

import 'package:myredux/reducers/CartReducer.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<List<CartItem>>(cartItemsReducer, initialState: []);
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<List<CartItem>> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<CartItem>>(
        store: store,
        child: MaterialApp(
            title: 'Flutter Redux Juned Raza',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home()));
  }
}
