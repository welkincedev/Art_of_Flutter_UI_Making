import 'package:firstsample/Widgets%20with%20Models/Model/Product/ShoppingCart.dart';
import 'package:flutter/material.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  List<SCart> scart = [
    SCart(
      pimage:
          "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
      price: "30",
      subtext: "Water Proof",
    ),
    SCart(
      pimage:
          "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
      price: "80",
      subtext: "Good",
    ),
    SCart(
      pimage:
          "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
      price: "130",
      subtext: "Great",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: Duration(milliseconds: 400),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Shop",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(isScrollable: true,indicator: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20),shape: BoxShape.rectangle),
            tabs: [
              Tab(text: ("New")),
              Tab(text: ("Trending")),
              Tab(text: ("Offers")),
            ],
          ),
        ),
      ),
    );
  }
}
