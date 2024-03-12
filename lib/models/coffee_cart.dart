// ignore_for_file: prefer_final_fields

import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeCartProvider extends ChangeNotifier {
  // coffee list
  final List<Coffee> _shop = [
    Coffee(
        name: 'Black Coffee', price: '10', imgPath: 'assets/icons/coffee.png'),
    Coffee(name: 'Espresso', price: '50', imgPath: 'assets/icons/espresso.png'),
    Coffee(
        name: 'Iced Coffee',
        price: '40',
        imgPath: 'assets/icons/ice-coffee.png'),
    Coffee(name: 'Latte', price: '50', imgPath: 'assets/icons/latte.png'),
  ];

  // get coffee list
  List<Coffee> get cofeeShop => _shop;

  //user cart
  List<Coffee> _userCart = [];

  // get user cart
  List<Coffee> get userCart => _userCart;

  //add item to user cart
  void addToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from user cart
  void removeFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
