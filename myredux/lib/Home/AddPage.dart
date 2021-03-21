import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myredux/models/CartItem.dart';

import 'package:myredux/reducers/CartReducer.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Add Item'),
              centerTitle: true,
            ),
            body: Container(
              height: mainAxisHeight,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      cursorColor: Colors.black,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Name'),
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.30,
                          child: TextFormField(
                            controller: sizeController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Size'),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: width * 0.30,
                          child: TextFormField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Quantity'),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Address'),
                    ),
                    SizedBox(height: 200),
                    StoreConnector<List<CartItem>, OnAddCallback>(
                        converter: (store) {
                      return (item) => store.dispatch(AddCartItemAction(item));
                    }, builder: (context, callback) {
                      return InkWell(
                          onTap: callback(CartItem(
                            name: nameController.text,
                            address: addressController.text,
                            size: 1,
                            quantity: 2,
                          )),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.black,
                            child: Text(
                              'Add Item',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ));
                    }),
                  ],
                ),
              ),
            )));
  }
}

typedef OnAddCallback = Function(CartItem itemName);
