import 'dart:developer';

import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_cart.dart';
import 'package:coffee_shop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void deleteItem(Coffee eachCoffee) {
    Provider.of<CoffeeCartProvider>(context, listen: false)
        .removeFromCart(eachCoffee);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Item removed'),
            ));
  }

  //payment integration
  void payNow() {
    log('payment integration');
    //payment integartion
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Consumer<CoffeeCartProvider>(builder: (context, cartCoffee, child) {
          return Column(
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: cartCoffee.userCart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = cartCoffee.userCart[index];

                  //return coffe tile
                  return CoffeeTile(
                      coffee: eachCoffee,
                      onButtonPressed: () => deleteItem(eachCoffee),
                      icon: const Icon(Icons.delete));
                },
              )),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.brown),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
