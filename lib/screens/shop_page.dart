import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_cart.dart';
import 'package:coffee_shop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee eachCoffee) {
    Provider.of<CoffeeCartProvider>(context, listen: false)
        .addToCart(eachCoffee);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully Added'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<CoffeeCartProvider>(builder: (context, coffee, child) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //header
              const Text('How Would You Like Your Coffee?',
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              //list of coffee items
              Expanded(
                  child: ListView.builder(
                itemCount: coffee.cofeeShop.length,
                itemBuilder: (context, index) {
                  //get the list of coffee items
                  Coffee eachCoffee = coffee.cofeeShop[index];
                  //return the tile
                  return CoffeeTile(
                    icon: const Icon(Icons.add),
                    coffee: eachCoffee,
                    onButtonPressed: () => addToCart(eachCoffee),
                  );
                },
              ))
            ],
          ),
        );
      }),
    );
  }
}
