// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade300,
          activeColor: Colors.grey[700],
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          tabs: const [
            GButton(icon: Icons.home, text: 'Shop'),
            GButton(icon: Icons.shopping_bag_outlined, text: 'Cart'),
          ]),
    );
  }
}
