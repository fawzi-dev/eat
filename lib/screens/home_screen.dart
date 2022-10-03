import 'package:eat/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle, size: 30),
        ),
        title: const Text('Food Delivery'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
