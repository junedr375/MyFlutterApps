import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myredux/Home/AddPage.dart';
import 'package:myredux/models/CartItem.dart';

import 'package:myredux/reducers/CartReducer.dart';

import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return StoreConnector<List<CartItem>, List<CartItem>>(
        converter: (store) => store.state,
        builder: (context, list) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Item List'),
              centerTitle: true,
            ),
            body: Container(
              height: mainAxisHeight,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: list?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        item: list[index],
                      )),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                print('Tapped');
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AddItemPage())));
              },
            ),
          ));
        });
  }
}

class ListTile extends StatefulWidget {
  final CartItem item;
  ListTile({this.item});

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return StoreConnector<List<CartItem>, OnStateChanged>(converter: (store) {
      return (item) => store.dispatch(RemoveCartItemAction(item));
    }, builder: (context, callback) {
      return Dismissible(
          onDismissed: callback(widget.item),
          background: Container(
            height: 100,
            width: width,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: Colors.grey[400])
                ]),
            child: Center(
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          key: UniqueKey(),
          child: InkWell(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            blurRadius: 5,
                            color: Colors.grey[400])
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.item.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Quantity ${widget.item.quantity}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Size ${widget.item.size}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Deliver to : ${widget.item.address}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ));
    });
  }
}

typedef OnStateChanged = Function(CartItem item);
