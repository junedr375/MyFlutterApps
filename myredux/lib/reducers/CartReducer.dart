import 'package:flutter/cupertino.dart';
import 'package:myredux/models/CartItem.dart';

class AddCartItemAction {
  final CartItem cartItem;

  AddCartItemAction(this.cartItem);
}

class RemoveCartItemAction {
  final CartItem cartItem;

  RemoveCartItemAction(this.cartItem);
}

class RemoveAllItemAction {}

List<CartItem> cartItemsReducer(List<CartItem> items, dynamic action) {
  if (action is AddCartItemAction) {
    return addItem(items, action);
  } else if (action is RemoveCartItemAction) {
    return removeItem(items, action);
  }
}

List<CartItem> addItem(List<CartItem> items, AddCartItemAction action) {
  return new List.from(items)..add(action.cartItem);
}

List<CartItem> removeItem(List<CartItem> items, RemoveCartItemAction action) {
  return items..removeWhere((item) => item.name == action.cartItem.name);
}
