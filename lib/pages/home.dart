import 'package:flutter/material.dart';
import 'package:pshopapp/pages/cartPage.dart';
import 'package:pshopapp/pages/favouritePage.dart';
import 'package:pshopapp/pages/mainPage.dart';
import 'package:pshopapp/pages/profilePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    MainPage(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.green,
              size: 30,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.green,
              size: 30,
            ),
            label: 'Favourite'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.green,
              size: 30,
            ),
            label: 'Profile'
          ),
        ],
      ),

      body: pages[selectedIndex],
    );
  }
}
