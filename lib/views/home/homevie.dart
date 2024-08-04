import 'package:final_hackathon/utils/color.dart';
import 'package:final_hackathon/views/categories/orderdetail.dart';

import 'package:final_hackathon/views/home/mainScreen.dart';
import 'package:final_hackathon/views/home/navigation/bottomnavigation/cart.dart';
import 'package:final_hackathon/views/home/navigation/productview.dart';
import 'package:final_hackathon/views/home/navigation/setting.dart';
import 'package:final_hackathon/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Search(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Orderdetail(), // Define SearchView
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(bounds),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors
                          .white, // This won't be visible due to ShaderMask
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white, // Ensure text color is white
                    ),
                  ),
                ),
              ),
              MainScreen(), // Make sure MainScreen is defined correctly
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient, // Apply gradient background
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 25),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt, size: 25), // Corrected icon for orders
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,
                  size: 25), // Corrected icon for account
              label: 'Account',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.purple[600],
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
